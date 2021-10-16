variable "userName" {
  default = "jchinkes"
}
variable "region" {
  description = "which region to work in"
  default = "us-west-2"
}
variable "ami_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "app_01"
}
variable "instance_type" {
  description = "size machine to use when making EC2 instance"
  type        = string
  default     = "t2-micro"
}
variable "ami_id" {
  description = "the AMI ID to use when making EC2 instance"
  type        = string
  default     = "ami-013a129d325529d4d"
}
variable "ami_key_name" {
  description = "The pem key for the EC2 instance SSH access"
  type        = string
  default     = "Chinkes-Food_01.pem"
}
variable "vpc_cidr" {
  description = "the cidr range for vpc overall use"
  default     = "10.0.0.0/24"
}
variable "privatesubnet_app" {
  description = "the subnet for app layer"
  default     = "10.0.0.128/25"
}