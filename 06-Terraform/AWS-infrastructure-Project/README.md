# AWS Infrastructure Project using Terraform

## Overview

This project demonstrates how to provision AWS infrastructure using Terraform (Infrastructure as Code).

The infrastructure includes:

* Custom VPC
* Public Subnet
* Private Subnet
* Internet Gateway (IGW)
* Route Table
* Route Table Association
* Security Group
* AWS Key Pair
* EC2 Instance

The objective of this project is to understand AWS networking fundamentals and automate infrastructure provisioning using Terraform.

---

## Architecture

```text
Internet
    │
    ▼
Internet Gateway
    │
    ▼
Route Table
    │
    ▼
Public Subnet
    │
    ▼
EC2 Instance
    │
    ▼
Security Group

VPC
├── Public Subnet (10.0.1.0/24)
└── Private Subnet (10.0.2.0/24)
```

---

## Technologies Used

* Terraform
* AWS EC2
* AWS VPC
* AWS Subnets
* AWS Internet Gateway
* AWS Route Tables
* AWS Security Groups
* AWS Key Pairs
* Linux (Ubuntu)

---

## Project Structure

```text
AWS-Infrastructure-Project/
│
├── provider.tf
├── VPC_Networking.tf
├── Security_Group.tf
├── Key_Pair.tf
├── EC2_Instance.tf
├── outputs.tf
├── README.md
```

---

## Resources Created

### VPC

Creates a custom AWS Virtual Private Cloud.

```hcl
resource "aws_vpc" "main"
```

Purpose:

* Network isolation
* Custom IP addressing
* Foundation for all AWS resources

---

### Public Subnet

Creates a subnet for internet-facing resources.

```hcl
resource "aws_subnet" "public_subnet"
```

Purpose:

* Host EC2 instances with internet access
* Host web servers and bastion hosts

---

### Private Subnet

Creates a subnet for internal resources.

```hcl
resource "aws_subnet" "private_subnet"
```

Purpose:

* Databases
* Backend services
* Internal applications

---

### Internet Gateway

Provides internet connectivity to the VPC.

```hcl
resource "aws_internet_gateway" "myIGW"
```

Purpose:

* Outbound internet access
* Inbound internet access

---

### Route Table

Defines network routing rules.

```hcl
resource "aws_route_table" "myroutetable"
```

Route:

```text
0.0.0.0/0 → Internet Gateway
```

Purpose:

* Direct internet-bound traffic through IGW

---

### Route Table Association

Associates the Route Table with the Public Subnet.

```hcl
resource "aws_route_table_association"
```

Purpose:

* Makes the subnet public

---

### Security Group

Acts as a virtual firewall.

```hcl
resource "aws_security_group" "my_security"
```

Rules:

* Allow SSH (Port 22)
* Allow outbound traffic

---

### Key Pair

Creates an AWS Key Pair for secure SSH access.

```hcl
resource "aws_key_pair" "my_key"
```

Purpose:

* Secure EC2 login
* SSH authentication

---

### EC2 Instance

Launches an EC2 instance in the Public Subnet.

```hcl
resource "aws_instance" "my_instance"
```

Purpose:

* Host applications
* Practice AWS and DevOps tools
* Demonstrate infrastructure deployment

---

## Deployment Steps

### Clone Repository

```bash
git clone <repository-url>
cd AWS-Infrastructure-Project
```

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Review Infrastructure

```bash
terraform plan
```

### Create Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

when prompted.

---

## Destroy Infrastructure

To remove all resources:

```bash
terraform destroy
```

---

## Learning Outcomes

Through this project, I gained hands-on experience with:

* Infrastructure as Code (IaC)
* Terraform fundamentals
* AWS networking concepts
* VPC and subnet design
* Internet Gateway configuration
* Route Tables and routing
* Security Groups
* EC2 provisioning
* SSH access using Key Pairs
* Resource dependencies in Terraform

---

## Future Improvements

Planned enhancements:

* NAT Gateway
* Private EC2 Instance
* Load Balancer
* Auto Scaling Group
* Terraform Modules
* Remote Backend using S3
* State Locking using DynamoDB
* CI/CD using GitHub Actions

---

## Author

Samir Patil

Aspiring AWS DevOps Engineer | Terraform | Kubernetes | GitHub Actions | Grafana | Cloud Infrastructure

