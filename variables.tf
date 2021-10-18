variable "userName" {
  default = "jchinkes"
}
variable "region" {
  description = "which region to work in"
  default     = "us-west-2"
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
variable "cidr_ranges" {
  description = "the cidr ranges for vpc use, we'll use cidrsubnet command to break down the subnets used for different purposes"
  type        = map(any)
  default = {
    main    = "10.0.0.0/8"
    app     = "10.1.0.0/20"
    web     = "10.100.0.0/20"
    private = "10.2.0.0/20"
    public  = "10.102.0.0/20"
  }
}
variable "subnet_newbit" {
  description = "newbit for each subnet to use with cidrsubnet"
  type        = map(any)
  default = {
    main    = "8"
    app     = "8"
    web     = "8"
    private = "8"
    public  = "8"
  }
}
variable "environment_netnum" {
  description = "netnum for for each subnet use with cidrsubnet"
  type        = map(any)
  default = {
    dev  = "1"
    qa   = "2"
    uat  = "3"
    prod = "4"
  }
}