# 🚀 Kubernetes Nginx Deployment using Kind (EC2)

## 📌 Overview
This project demonstrates a basic Kubernetes deployment of an Nginx application using a Kind cluster running on an AWS EC2 instance.  
The application is deployed using Kubernetes Deployment and exposed using a Service.

Due to Kind networking limitations on EC2, the application is accessed using `kubectl port-forward`.

---

## ⚙️ Tech Stack
- Kubernetes (Kind)
- Docker (inside EC2)
- kubectl
- Nginx container
- AWS EC2 (Ubuntu)

---

## 🏗️ Architecture

EC2 Instance  
└── Docker  
    └── Kind Kubernetes Cluster  
        ├── Namespace  
        ├── Deployment (Nginx Pods)  
        ├── Service (ClusterIP / NodePort)  
        └── Port-Forward (External Access)

---

## 📁 Project Structure

- `namespace.yml` → Creates isolated namespace  
- `deployment.yml` → Deploys Nginx pods using ReplicaSet  
- `service.yml` → Exposes pods using Kubernetes Service  
- `kind.yaml` → Kind cluster configuration for EC2 setup  

---

## 🚀 Deployment Steps

### 1. Create Namespace
```bash
kubectl apply -f namespace.yml

### 2. Create Deployment
```bash
kubectl apply -f deployment.yml

### 3. Create Service
```bash
kubectl apply -f service.yml

### 4. Verify resource
```bash
kubectl get all -n nginx-namespace-project

### 5. Access Application (Port Forward)
```bash
kubectl get all -n nginx-namespace-project


#### Key Highlghts about Project 

🔄 Why Port-Forward was Used Instead of NodePort (Important Note)
Initially, the application was exposed using a NodePort Service, with the expectation that it could be accessed via:
http://<EC2-Public-IP>:<NodePort>
However, since the Kubernetes cluster was created using Kind (Kubernetes-in-Docker) on an EC2 instance, the networking behaves differently compared to a traditional VM-based Kubernetes setup.
⚠️ Issue Faced
•	NodePort was created successfully 
•	Service and Pods were working correctly inside the cluster 
•	However, the application was not accessible via EC2 public IP and NodePort 
🧠 Root Cause
•	Kind runs Kubernetes inside Docker containers 
•	NodePort is exposed inside the container network, not directly on the EC2 host 
•	Therefore, external browser access via public IP was not possible 
✅ Solution Applied
To verify and access the application, kubectl port-forward was used:
kubectl port-forward svc/nginx-service-project 8080:80 -n nginx-namespace-project
This created a secure tunnel from:
Local Machine → Kubernetes Service → Pod
🌐 Final Access Method
http://localhost:8080
________________________________________
📌 Key Learning
•	NodePort behavior depends on cluster environment 
•	Kind clusters are primarily for local/testing purposes 
•	Port-forward is a reliable debugging and access method in such environments 
•	Real-world production setups typically use LoadBalancer or Ingress instead of NodePort in similar scenarios 

