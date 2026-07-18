variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type        = string
}

variable "instance_type" {
  description = "EC2_Instance"
  type        = string
}

variable "subnet_cidr" {
  description = "Public subnet CIDR rane"
  type        = string
}
