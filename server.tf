resource "aws_instance" "app_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.ami_key_name
  security_groups = ["${aws_security_group.ingress-all-test.id}"]

  tags = {
    Name      = var.ami_name
    CreatedBy = var.userName
  }

  subnet_id = aws_subnet.privatesubnet.id
}