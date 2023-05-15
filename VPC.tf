module "vpc" {
  source = "./modules/vpc"

  userName   = var.userName
  vpc_name   = "${var.Env}-vpc" # we don't name VPC...
  cidr_range = lookup(var.cidr_ranges, "main")

  for_each        = var.vpc
  azs             = each.value.azs[0]
  private_subnets = each.value.private_subnets[0]
  public_subnets  = each.value.public_subnets[0]

  Env = var.Env
  tags = {
    Environment = var.Env
    CreatedBy   = var.userName
  }
}
