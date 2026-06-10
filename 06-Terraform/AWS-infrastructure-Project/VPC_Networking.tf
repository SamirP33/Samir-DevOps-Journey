resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Terraform-VPC"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public-Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private-Subnet"
  }
}

resource "aws_internet_gateway" "myIGW" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "AWS_IGW"
  }
}

resource "aws_route_table" "myroutetable" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myIGW.id
  }

  tags = {
    Name = "Terraform-Route"

  }
}

resource "aws_route_table_association" "associate_route_table" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.myroutetable.id
}
