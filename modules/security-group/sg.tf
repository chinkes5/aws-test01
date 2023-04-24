variable "sg_map" {
  description = "A map of security groups handed in via one object"
  type = map(object({
    name                    = string
    description             = string
    ingress_cidr_blocks     = list(string)
    ingress_security_groups = list(string)
    ingress_from_port       = number
    ingress_to_port         = number
    ingress_protocol        = string
    egress_cidr_blocks      = list(string)
    egress_security_groups  = list(string)
    egress_from_port        = number
    egress_to_port          = number
    egress_protocol         = string
  }))
}

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  for_each = toset()


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
      from_port   = var.egress_map["from"]
      to_port     = var.egress_map["to"]
      protocol    = var.egress_map["protocol"]
      description = var.egress_map["description"]
      cidr_blocks = var.egress_map["cidr_blocks"]
    },
  ]

  tags = {
    Terraform   = "true"
    Environment = var.Env
    CreatedBy   = var.userName
  }
}
