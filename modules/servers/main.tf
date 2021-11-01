resource "aws_instance" "sample_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.ami_key_name
  security_groups = [var.server_security_group.id]

  tags = {
    Name      = var.server_name
    CreatedBy = var.userName
  }

  subnet_id = var.server_subnets
}
