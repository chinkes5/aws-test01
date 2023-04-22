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
  type        = map(string)
  description = "map of values to allow ingress, needing the following: to, from, protocol, description, cidr blocks"
  default = {
    "to"        = 80
    "from"      = 80
    protocol    = "tcp"
    description = "default ingress on port 80, tcp, from anywhere"
    cidr_blocks = "0.0.0.0/0"
  }
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
  type        = map(string)
  description = "map of values to allow egress, needing the following: to, from, protocol, description, cidr blocks"
  default = {
    "to"        = 80
    "from"      = 80
    protocol    = "tcp"
    description = "default egress on port 80, tcp, to anywhere"
    cidr_blocks = "0.0.0.0/0"
  }
}
