variable "vpcName" {
  type        = string
  description = "Name of the VPC"
}

variable "cidr_range" {
  type        = string
  description = "The CIDR range for this VPC"
}

variable "azs" {
  type        = string
  description = "Which AZ your VPC will be in"
}

variable "private_subnets" {
  type        = string
  description = "Private Subnet CIDR"
}

variable "public_subnets" {
  type        = string
  description = "Public Subnet CIDR"
}

variable "Env" {
  type        = string
  description = "The Environment Tag for this VPC"
}
