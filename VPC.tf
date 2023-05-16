module "vpc" {
  source = "./modules/vpc"

  userName   = var.userName
  vpc_name   = "${var.Env}-vpc"
  cidr_range = lookup(var.cidr_ranges, "main")

  for_each       = var.vpc
  az             = each.key
  private_subnet = each.value.private_subnet
  public_subnet  = each.value.public_subnet

  Env = var.Env
  tags = {
    Environment = var.Env
    CreatedBy   = var.userName
  }
}
