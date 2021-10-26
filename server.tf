resource "aws_instance" "bastion_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.ami_key_name
  security_groups = [aws_security_group.ingress-all-test.id]

  tags = {
    Name      = "bastion_server"
    CreatedBy = var.userName
  }

  subnet_id = module.vpc.public_subnets[0] #how to define where this is?
}
resource "aws_instance" "app_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.ami_key_name
  security_groups = [aws_security_group.ingress-internal.id]

  tags = {
    Name      = "app_server"
    CreatedBy = var.userName
  }

  subnet_id = module.vpc.private_subnets[0] #how to define where this is?
}
resource "aws_instance" "web_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.ami_key_name
  security_groups = [aws_security_group.ingress-web.id]

  tags = {
    Name      = "web_server"
    CreatedBy = var.userName
  }

  subnet_id = module.vpc.public_subnets[1] #how to define where this is?
}