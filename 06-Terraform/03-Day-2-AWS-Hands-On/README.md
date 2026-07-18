# Terraform Day 2 - AWS Hands-on

## Project Overview

This project provisions a basic AWS infrastructure using Terraform.

## AWS Resources Created

- VPC
- Internet Gateway
- Public Subnet
- Route Table
- Route Table Association
- Security Group
- EC2 Instance

## Project Structure

- provider.tf - AWS Provider configuration
- main.tf - AWS resources
- variables.tf - Input variables
- terraform.tfvars.example - Sample variable values
- outputs.tf - Output values after deployment

## Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

## Skills Demonstrated

- Infrastructure as Code (IaC)
- AWS Provider Configuration
- VPC Networking
- EC2 Provisioning
- Variables
- Outputs
- Terraform Workflow
