resource "aws_vpc" "default" {

  cidr_block = var.cidr_range

  tags = merge(
    { Name = var.vpc_name },
    { Environment = var.Env },
    { CreatedBy = var.userName },
  )
}

# add more resources here to consume the other values I have and make the VPC the way I want it.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_internet_gateway" "gw" {
  count  = var.enable_nat_gateway ? 1 : 0
  vpc_id = aws_vpc.default.id

  tags = merge(
    { Name = "${var.vpc_name}-gateway" },
    { Environment = var.Env },
    { CreatedBy = var.userName },
  )
}

resource "aws_subnet" "publicsubnets" {
  vpc_id     = aws_vpc.default.id
  cidr_block = var.public_subnets

  tags = merge(
    { Name = "${var.vpc_name}-gateway" },
    { Environment = var.Env },
    { CreatedBy = var.userName },
  )
}

resource "aws_subnet" "privatesubnets" {
  vpc_id     = aws_vpc.default.id
  cidr_block = var.private_subnets

  tags = merge(
    { Name = "${var.vpc_name}-gateway" },
    { Environment = var.Env },
    { CreatedBy = var.userName },
  )
}
# azs             = var.azs

# enable_vpn_gateway = true
