module "aws_security_group" {
  source = "./modules/security-group"

  userName = var.userName

  for_each       = var.sg_details
  sg_name        = "${each.key}-${var.Env}"
  sg_description = each.value.description
  vpc_id         = module.vpc.vpc_id
  Env = var.Env
  
  ingress_map = {
    from_port       = each.value.ingress_from_port
    to_port         = each.value.ingress_to_port
    protocol        = each.value.ingress_protocol
    cidr_blocks     = each.value.ingress_cidr_blocks
    security_groups = each.value.ingress_security_groups
  }
  
  // Terraform removes the default rule
  egress_map = {
    from_port       = each.value.egress_from_port
    to_port         = each.value.egress_to_port
    protocol        = each.value.egress_protocol
    cidr_blocks     = each.value.egress_cidr_blocks
    security_groups = each.value.egress_security_groups
  }
  
    tags = merge(
    { Environment = var.Env },
    { CreatedBy = var.userName },
    { Created = timestamp() }
  )

  depends_on = [
    module.vpc
  ]
}
