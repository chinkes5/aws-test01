resource "aws_vpc" "vpc" {
  cidr_block           = lookup(var.cidr_ranges, "main") #one is needed but you can make 4 more (soft limit)
  instance_tenancy     = "default"                       #the other option is expensive!
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "main vpc"
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
resource "aws_route_table_association" "publicsubnet1routetableassociation" {
  route_table_id = aws_route_table.publicroutetable.id
  subnet_id      = aws_subnet.publicsubnet1.id
}
resource "aws_route_table_association" "publicsubnet2routetableassociation" {
  route_table_id = aws_route_table.publicroutetable.id
  subnet_id      = aws_subnet.publicsubnet2.id
}
resource "aws_route_table_association" "igwroutetableassociation" {
  #connect the IGW to the route table for access from internet
  route_table_id = aws_route_table.publicroutetable.id
  gateway_id = aws_internet_gateway.internetgateway.id
}
resource "aws_nat_gateway" "natgateway" {
  allocation_id = "aws_eip.ip.id"
  subnet_id     = "aws_subnet.publicsubnet1.id"
  #subnet_id     = "aws_subnet.publicsubnet2.id"
  tags = {
    name = "dev nat gateway"
  }
  depends_on = [
    aws_eip.elasticIP
  ]
}
resource "aws_route_table" "privateroutetable" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "private route table"
  }
}
resource "aws_route_table_association" "privatesubnet1routetableassociation" {
  route_table_id = aws_route_table.privateroutetable.id
  subnet_id      = aws_subnet.privatesubnet1.id
}
resource "aws_route_table_association" "privatesubnet2routetableassociation" {
  route_table_id = aws_route_table.privateroutetable.id
  subnet_id      = aws_subnet.privatesubnet2.id
}
