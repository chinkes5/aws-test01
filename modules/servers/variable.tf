variable "userName" {
  description = "Value of a tag for the EC2 instance creator"
  type        = string
}
variable "server_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "app_"
}
variable "instance_type" {
  description = "size machine to use when making EC2 instance"
  type        = string
  default     = "t2.micro"
}
variable "ami_id" {
  description = "the AMI ID to use when making EC2 instance"
  type        = string
  default     = "ami-013a129d325529d4d"
}
variable "ami_key_name" {
  description = "The pem key for the EC2 instance SSH access"
  type        = string
}
variable "server_subnets" {
  description = "the subnet to use for this server"
}
variable "server_security_group" {
  description = "the security groups in a map or list to apply to the server"
  type        = map(any)
}