provider "aws" {
  region = var.aws_region
}
terraform {
  backend "s3" {
    bucket = "anji0011"
    key    = "ansible.tfstate"
    region = "us-east-1"
  }

}
resource "aws_vpc" "VPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.vpc_name}"
    Owner       = "Aanjaneyulu"
    environment = "${var.environment}"
  }
}
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.VPC.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}
resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = "${var.vpc_name}-MRT"
  }
}

resource "aws_route_table_association" "terraform-public" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.terraform-public.id
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.VPC.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["0::0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["0::0/0"]
  }
}
