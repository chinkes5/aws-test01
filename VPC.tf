module "vpc" {
  source = "./modules/vpc"

  userName   = var.userName
  vpc_name   = "${var.Env}-vpc"
  cidr_range = lookup(var.cidr_ranges, "main")

  for_each        = var.vpc
  azs             = each.value.azs
  private_subnets = each.value.private_subnets
  public_subnets  = each.value.public_subnets

  Env = var.Env
  /*   tags = {
    Terraform   = "true"
    Environment = var.Env
    CreatedBy   = var.userName
  }
 */
}
