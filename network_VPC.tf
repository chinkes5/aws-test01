module "vpc" {
  source = "./modules/vpc"

  name = "vpc"
  cidr = lookup(var.cidr_ranges, "main")

  for_each        = var.vpc
  azs             = each.value.azs
  private_subnets = each.value.private_subnets
  public_subnets  = each.value.public_subnets

  tags = {
    Environment = var.Env
  }
}
