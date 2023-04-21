module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

#   ingress_cidr_blocks = var.ingress_cidr
#   ingress_rules       = var.ingress_rules
  ingress_with_cidr_blocks = [
    {
      from_port   = var.ingress_map["from"]
      to_port     = var.ingress_map["to"]
      protocol    = var.ingress_map["protocol"]
      description = var.ingress_map["description"]
      cidr_blocks = var.ingress_map["cidr_blocks"]
    },
  ]
#   egress_cidr_blocks = var.egress_cidr
#   egress_rules       = var.egress_rules
  egress_with_cidr_blocks = [
    {
      from_port   = 10
      to_port     = 20
      protocol    = 6
      description = "Service name"
      cidr_blocks = "10.10.0.0/20"
    },
  ]

  tags = {
    Terraform   = "true"
    Environment = var.Env
  }
}
