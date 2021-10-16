resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "main_vpc"
  }
}

resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.privatesubnet_app

  tags = {
    Name = "app_private_subnet"
  }
}

resource "aws_eip" "ip-test-env" {
  instance = aws_instance.app_server.id
  vpc      = true
  tags = {
    name = "public-ip"
  }

}

resource "aws_internet_gateway" "internetgateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "prod internetgateway"
  }
}
