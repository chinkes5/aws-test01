module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.s3_name
  acl    = var.s3_acl

  versioning = {
    enabled = var.s3_versioning
  }
}
