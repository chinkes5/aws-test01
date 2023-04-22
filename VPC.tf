module "vpc" {
  source = "./modules/vpc"

  name = var.Env + "-vpc"
  cidr = lookup(var.cidr_ranges, "main")

  for_each        = var.vpc
  azs             = each.value.azs
  private_subnets = each.value.private_subnets
  public_subnets  = each.value.public_subnets

  tags = {
    Terraform   = "true"
    Environment = var.Env
    CreatedBy   = var.userName
  }
}
