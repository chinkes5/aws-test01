variable "userName" {
  type        = string
  description = "Username to associate run to"
}

variable "region" {
  type        = string
  description = "which region to work in"
  default     = "us-west-2"
}

variable "Env" {
  type        = string
  description = "A name of the environment, used in tagging resources"
}
variable "cidr_ranges" {
  description = "the cidr ranges for vpc use, we'll use cidrsubnet command to break down the subnets used for different purposes"
  type        = map(any)
}

variable "vpc" {
  description = "Map of VPC details"
  type = object({
    azs             = list(string)
    private_subnets = list(string)
    public_subnets  = list(string)
  })
}

variable "sg_details" {
  description = "Map of security group details"
  type = map(object({
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

variable "server_details" {
  description = "Map of all server details"
  type = map(object({
    description     = string
    instance_type   = string
    ami_id          = string
    ami_key_name    = string
    IssuePublicIP   = bool
    security_group  = list(string)
    private_subnets = bool
  }))
}
