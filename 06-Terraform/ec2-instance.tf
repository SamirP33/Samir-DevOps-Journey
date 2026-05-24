resource "aws_instance" "my_instance" {
	ami = "ami-091138d0f0d41ff90"
	instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}
