resource "aws_vpc" "vpc" {
  cidr_block = cidrsubnet(
    lookup(var.cidr_ranges, "main"),
    lookup(var.subnet_newbit, "main"),
    lookup(var.environment_netnum, "dev")
  )
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "main vpc"
  }
}

resource "aws_subnet" "privatesubnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(
    lookup(var.cidr_ranges, "app"),
    lookup(var.subnet_newbit, "app"),
    lookup(var.environment_netnum, "dev")
  )
  tags = {
    Name = "dev app subnet"
  }
}
resource "aws_subnet" "publicsubnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(
    lookup(var.cidr_ranges, "web"),
    lookup(var.subnet_newbit, "web"),
    lookup(var.environment_netnum, "dev")
  )

  tags = {
    Name = "dev web subnet"
  }
}

resource "aws_eip" "elasticIP" {
  instance = aws_instance.app_server.id
  vpc      = true
  tags = {
    name = "public-ip"
  }

}

resource "aws_internet_gateway" "internetgateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "dev internet gateway"
  }
}
resource "aws_route_table" "publicroutetable" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "public route table"
  }
}
resource "aws_route_table_association" "publicsubetroutetableassociation" {
  route_table_id = aws_route_table.publicroutetable.id
  subnet_id      = aws_subnet.publicsubnet.id
}
resource "aws_nat_gateway" "natgateway" {
  allocation_id = "aws_eip.ip.id"
  subnet_id     = "aws_subnet.publicsubnet.id"
  tags = {
    name = "dev nat gateway"
  }
  depends_on = [aws_eip.elasticIP]
}
resource "aws_route_table" "privateroutetable" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "private route table"
  }
}
resource "aws_route_table_association" "privatesubetroutetableassociation" {
  route_table_id = aws_route_table.privateroutetable.id
  subnet_id      = aws_subnet.privatesubnet.id
}
