variable "userName" {
  type        = string
  description = "Username to associate run to"
}

variable "ec2_name" {
  type        = string
  description = "Name of ec2 instance created"
}

variable "ec2_description" {
  type        = string
  description = "Text describing the role or purpose of instance"
}

variable "ami_id" {
  type        = string
  description = "ID for AMI to use in creating instance"
}

variable "instance_type" {
  type        = string
  description = "Size of instance created"
}

variable "vpc_security_group_ids" {
  type        = string
  description = "Any SG ID to associate to instance"
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID to associate to instance"
}
