variable "sg_name" {
  type        = string
  description = "name of the security group being created"
}

variable "sg_description" {
  type        = string
  description = "text to identify or otherwise describe this security group"
}

# variable "ingress_cidr" {
#   type        = map(string)
#   description = "map of cidr entries to allow in"
# }

# variable "ingress_rules" {
#   type        = map(string)
#   description = "map of rules to allow in"
# }

variable "ingress_map" {
  description = "map of values to allow ingress, needing the following: to, from, protocol, description, cidr blocks"
  type = map(object({
    to              = number
    from            = number
    protocol        = string
    description     = string
    cidr_blocks     = list(string)
    security_groups = list(string)
  }))
}

# variable "egress_cidr" {
#   type        = map(string)
#   description = "map of cidr entries to allow out"
# }

# variable "egress_rules" {
#   type        = map(string)
#   description = "map of rules to allow out"
# }

variable "egress_map" {
  description = "map of values to allow egress, needing the following: to, from, protocol, description, cidr blocks"
  type = map(object({
    to              = number
    from            = number
    protocol        = string
    description     = string
    cidr_blocks     = list(string)
    security_groups = list(string)
  }))
}
