resource "aws_key_pair" "my_key" {
  key_name   = "AWS_Infra"
  public_key = file("/home/ubuntu/.ssh/AWS-Infra.pub")
}
