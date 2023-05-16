# need this here as I have a file making SG?
/* data "aws_security_groups" "security_group_name" {
  security_group_name = module.security_group.security_group_name
} */


# module "ec2_instance" {
#   userName = var.userName

#   source = "./modules/ec2"

#   for_each = var.server_details

#   ec2_name        = "${each.key}-${var.Env}"
#   ec2_description = each.value.description
#   ami_id          = each.value.ami_id
#   instance_type   = each.value.instance_type
#   # key_name               = each.value.ami_key_name
#   # monitoring             = true
#   vpc_security_group_ids = [each.value.security_group]
#   # use the correct subnet based on bool status
#   subnet_id = private_subnet ? vpc.private_subnet : vpc.private_subnet

#   /* tags = {
#     Terraform   = "true"
#     Environment = var.Env
#     CreatedBy   = var.userName
#   } */

#   depends_on = [
#     module.vpc,
#     module.security-group
#   ]

# }