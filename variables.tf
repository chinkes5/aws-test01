variable "userName" {
  type        = string
  description = "Username to associate run to"
}
variable "region" {
  description = "which region to work in"
}
variable "cidr_ranges" {
  description = "the cidr ranges for vpc use, we'll use cidrsubnet command to break down the subnets used for different purposes"
  type        = map(any)
}
variable "vpc" {
  description = "Map of VPC details"
  type = map(object({
    azs             = list
    private_subnets = list
    public_subnets  = list
  }))
}

variable "sg_details" {
  description = "Map of security group details"
  type = map(object({
    name                    = string
    description             = string
    ingress_cidr_blocks     = list
    ingress_security_groups = list
    ingress_from_port       = number
    ingress_to_port         = number
    ingress_protocol        = string
    egress_cidr_blocks      = list
    egress_security_groups  = list
    egress_from_port        = number
    egress_to_port          = number
    egress_protocol         = string
  }))
}

variable "server_details" {
  description = "Map of all server details"
  type = map(object({
    server_name    = string
    description    = string
    instance_type  = string
    ami_id         = string
    ami_key_name   = string
    IssuePublicIP  = bool
    security_group = map
    subnets        = map
  }))
}
