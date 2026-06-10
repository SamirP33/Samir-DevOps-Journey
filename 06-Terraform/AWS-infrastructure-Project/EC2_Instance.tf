provider "aws" {
  region = var.region
}

resource "aws_instance" "my_instance" {
  ami           = var.ec2_ubuntu_ami
  instance_type = var.instance_type

  subnet_id = aws_subnet.public_subnet.id

  vpc_security_group_ids = [aws_security_group.my_security.id]

  associate_public_ip_address = true

  key_name = aws_key_pair.my_key.key_name

  tags = {
    Name = "AWS_Infrastructure_Project"

  }
}

resource "aws_security_group" "my_security" {
  name        = "My_Security_Group"
  description = "Allow SSH Access"

  vpc_id = aws_vpc.main.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
