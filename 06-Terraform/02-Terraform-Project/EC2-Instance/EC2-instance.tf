provider "aws" {
	region = "us-east-1"
}

resource "aws_instance" "my_instance" {
	ami = var.ec2_ubuntu_ami
	instance_type = var.ec2_instance_type

	key_name = aws_key_pair.mykeypair.key_name
	

	vpc_security_group_ids = [aws_security_group.my_security_group.id]

  tags = {
    Name = "Terraform-Project"
  }
}

resource "aws_key_pair" "mykeypair" {
	key_name = "terraform-project"
	public_key = file ("/home/ubuntu/.ssh/terraform-key.pub")
}

resource "aws_security_group" "my_security_group" {
	name = "security_group"

ingress {
	description = "Allow-ssh-login"
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
egress {
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_s3_bucket" "My_bucket" {
  bucket_name = var.bucket_name
}
