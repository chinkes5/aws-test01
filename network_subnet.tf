resource "aws_subnet" "privatesubnet1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(
    lookup(var.cidr_ranges, "app"),
    lookup(var.subnet_newbit, "app"),
    lookup(var.environment_netnum, "dev")
  )
  availability_zone = var.AZ1
  tags = {
    Name = "dev app subnet"
  }
}
resource "aws_subnet" "privatesubnet2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(
    lookup(var.cidr_ranges, "app"),
    lookup(var.subnet_newbit, "app"),
    lookup(var.environment_netnum, "qa")
  )
  availability_zone = var.AZ2
  tags = {
    Name = "dev app subnet"
  }
}
resource "aws_subnet" "publicsubnet1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(
    lookup(var.cidr_ranges, "web"),
    lookup(var.subnet_newbit, "web"),
    lookup(var.environment_netnum, "dev")
  )
  availability_zone       = var.AZ1
  map_public_ip_on_launch = var.IssuePublicIP
  tags = {
    Name = "dev web subnet"
  }
}
resource "aws_subnet" "publicsubnet2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(
    lookup(var.cidr_ranges, "web"),
    lookup(var.subnet_newbit, "web"),
    lookup(var.environment_netnum, "qa")
  )
  availability_zone       = var.AZ2
  map_public_ip_on_launch = var.IssuePublicIP
  tags = {
    Name = "dev web subnet"
  }
}
