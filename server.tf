data "aws_security_groups" "security_group_name" {
  security_group_name = module.security_group.security_group_name
}

module "ec2_instance" {
  source = "./modules/ec2"

  for_each = var.server_details

  name                   = each.key
  ami                    = each.value.ami_id
  instance_type          = each.value.instance_type
  key_name               = each.value.ami_key_name
  monitoring             = true
  vpc_security_group_ids = [each.value.security_group]
  subnet_id              = each.value.subnet

  tags = {
    Terraform   = "true"
    Environment = var.Env
    CreatedBy   = var.userName
  }

  depends_on = [
    module.vpc,
    module.security-group
  ]

}