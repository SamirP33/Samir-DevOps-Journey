output "vpc_id" {
  description = "ID of vpc"
  value       = aws_vpc.main.id
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.web.id
}

output "subnet_id" {
  description = "Public subnet id"
  value       = aws_subnet.public.id
}

output "ec2_public_ip" {
  description = "EC2 public ip"
  value       = aws_instance.web.public_ip
}
