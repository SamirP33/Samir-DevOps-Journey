# CI/CD Pipeline using Jenkins, SonarQube & Nexus on AWS

## Project Overview

This project demonstrates a complete **CI/CD pipeline** implementation using Jenkins, SonarQube, and Nexus on AWS EC2 instances.
The pipeline automates the process of building, analyzing, and storing application artifacts.

---

## Architecture

```
GitHub → Jenkins → Build (Maven) → SonarQube → Nexus
```

---

## Tools & Technologies Used

* Jenkins (CI/CD automation)
* SonarQube (Code quality analysis)
* Nexus Repository (Artifact storage)
* AWS EC2 (Infrastructure)
* Maven (Build tool)
* Git & GitHub (Version control)

---

## Project Setup ##

### 1. AWS Infrastructure

* Created **3 EC2 instances**:

  * Jenkins Server
  * SonarQube Server
  * Nexus Server

---

### 2.Jenkins Setup

* Installed Jenkins on EC2
* Configured required plugins:

  * SonarQube Scanner
  * Nexus Artifact Uploader
  * Pipeline Maven Integration
* Created pipeline using Jenkinsfile

---

### 3.SonarQube Integration

* Configured SonarQube server in Jenkins
* Generated authentication token
* Integrated pipeline with SonarQube for code analysis

---

### 4.Nexus Setup

* Installed Nexus Repository
* Created Maven hosted repository (`maven-releases`)
* Added credentials in Jenkins for secure upload

---

## Pipeline Workflow

1. Code is pulled from GitHub repository
2. Jenkins builds the application using Maven
3. SonarQube performs static code analysis
4. Artifact (.jar file) is generated
5. Artifact is uploaded to Nexus repository

---

## Output

* Successful build using Jenkins
* Code quality report in SonarQube
* Artifact stored in Nexus

---

## Project Structure

```
05-CI-CD/
│
├── Jenkinsfile
├── setup.sh
├── README.md
├── screenshots/
└── cicd-notes.txt
```

---


