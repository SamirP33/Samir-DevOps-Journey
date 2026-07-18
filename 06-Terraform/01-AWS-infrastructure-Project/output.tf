output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.my_instance.id
}

output "public_ip" {
  description = "Ec2 Public ID"
  value       = aws_instance.my_instance.public_ip
}

output "vpc_id" {
  description = "VPC Id"
  value       = aws_vpc.main.id
}
