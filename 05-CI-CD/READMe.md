# CI/CD Pipeline using Jenkins, SonarQube & Docker on AWS

## Project Overview

This project demonstrates a complete CI/CD pipeline implementation using Jenkins, SonarQube, and Docker on AWS EC2 instances.  
The pipeline automates the process of building, analyzing, containerizing, and deploying applications.

---
## Architecture
---
## Tools & Technologies Used

* Jenkins (CI/CD automation)
* SonarQube (Code quality analysis)
* Docker (Containerization)
* Docker Hub (Image registry)
* AWS EC2 (Infrastructure)
* Maven (Build tool)
* Git & GitHub (Version control)

---

## Project Setup

### 1. AWS Infrastructure

* Created **3 EC2 instances**:

  * Jenkins Server  
  * SonarQube Server  
  * Docker Server  

---

### 2. Jenkins Setup

* Installed Jenkins on EC2
* Configured required tools:

  * Maven  
  * JDK 17  
* Installed Docker on Jenkins server
* Added Jenkins user to Docker group
* Created pipeline using Jenkinsfile

---

### 3. SonarQube Integration

* Deployed SonarQube using Docker
* Configured SonarQube server in Jenkins
* Generated authentication token
* Integrated pipeline for code analysis

---

### 4. Docker Setup

* Installed Docker on EC2
* Created Dockerfile for application
* Built Docker image from Spring Boot application
* Verified container execution

---

### 5. Docker Hub Integration

* Created repository on Docker Hub
* Generated access token
* Logged in using CLI
* Pushed Docker image to Docker Hub

---

## Pipeline Workflow

1. Code is pulled from GitHub repository  
2. Jenkins builds the application using Maven  
3. SonarQube performs static code analysis  
4. Docker image is built using Dockerfile  
5. Docker image is pushed to Docker Hub  

---

## Output

* Successful build using Jenkins  
* Code quality report in SonarQube  
* Docker image available in Docker Hub  
* Application can be deployed anywhere using Docker  

---
