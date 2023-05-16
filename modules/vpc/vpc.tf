resource "aws_vpc" "default" {

  cidr_block = var.cidr_range

  tags = merge(
    { Name = var.vpc_name },
    { Environment = var.Env },
    { CreatedBy = var.userName },
    { Created = timestamp() }
  )
}

resource "aws_internet_gateway" "gw" {
  count  = var.enable_nat_gateway ? 1 : 0
  vpc_id = aws_vpc.default.id

  tags = merge(
    { Name = "${var.vpc_name}-gateway" },
    { Environment = var.Env },
    { CreatedBy = var.userName },
    { Created = timestamp() }
  )
}

resource "aws_subnet" "privatesubnets" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet
  availability_zone = var.az

  # tags = merge(
  #   { Environment = var.Env },
  #   { CreatedBy = var.userName },
  # )
}

resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.default.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgw.id
  }

  # tags = merge(
  #   { Environment = var.Env },
  #   { CreatedBy = var.userName },
  # )
}

resource "aws_route_table_association" "privateRTassociation" {
  route_table_id = aws_route_table.privateRT.id
  subnet_id      = aws_subnet.privatesubnets.id

  # tags = merge(
  #   { Environment = var.Env },
  #   { CreatedBy = var.userName },
  # )
}

resource "aws_subnet" "publicsubnets" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_subnet
  availability_zone       = var.az
  map_public_ip_on_launch = true

  # tags = merge(
  #   { Environment = var.Env },
  #   { CreatedBy = var.userName },
  # )
}

resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw[0].id
  }

  # tags = merge(
  #   { Environment = var.Env },
  #   { CreatedBy = var.userName },
  # )
}

resource "aws_route_table_association" "publicRTassociation" {
  route_table_id = aws_route_table.publicRT.id
  subnet_id      = aws_subnet.publicsubnets.id

  # tags = merge(
  #   { Environment = var.Env },
  #   { CreatedBy = var.userName },
  # )
}

resource "aws_eip" "nateIP" {
  vpc = true
}

resource "aws_nat_gateway" "NATgw" {
  allocation_id = aws_eip.nateIP.id
  subnet_id     = aws_subnet.publicsubnets.id
}