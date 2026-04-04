# AWS DevOps Project - Scalable Web Application

## Project Overview
This project demonstrates a scalable multi-tier architecture on AWS using EC2, Load Balancer, and Auto Scaling.

##  Architecture
User → Load Balancer → Auto Scaling (Tomcat) → Backend (MySQL, Memcached, RabbitMQ)

##  Technologies Used
- AWS EC2
- Application Load Balancer
- Auto Scaling Group
- Apache Tomcat
- MySQL
- Memcached
- RabbitMQ
- Ubuntu

##  Setup Steps

### Backend Setup
- Install MySQL, Memcached, RabbitMQ

### Application Setup
- Install Java
- Setup Apache Tomcat

### Load Balancer
- Configure Target Group
- Attach EC2 instances

### Auto Scaling
- Create AMI
- Launch Template
- Configure scaling policy

##  Challenges Faced
- Instances unhealthy due to Tomcat not auto-starting
- Fixed using systemd service and AMI update

##  Outcome
- Highly available and scalable system
- Automatic traffic distribution
- Self-healing infrastructure
