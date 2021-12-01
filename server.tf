data "local_file" "json_config" {
  path = "/varables.tf.json"
}

locals {
  server = jsondecode(data.local_file.json_config.server1)
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  #fileexists("variables.tf.json") ? file("variables.tf.json") : local.default_content
  for_each = toset(["server1", "server2", "server3"])

  name = "instance-${each.value.name}"

  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.ami_key_name
  monitoring             = true
  vpc_security_group_ids = [each.value.security_group]
  subnet_id              = each.value.subnet

  tags = {
    Terraform   = "true"
    Environment = "dev"
    CreatedBy   = var.userName
  }
}