variable "userName" {
  default = "jchinkes"
}
variable "region" {
  description = "which region to work in"
  default     = "us-west-2"
}
variable "server_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "app_01"
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
  default     = "Chinkes-Food_02"
}
variable "cidr_ranges" {
  description = "the cidr ranges for vpc use, we'll use cidrsubnet command to break down the subnets used for different purposes"
  type        = map(any)
  default = {
    main    = "10.0.0.0/16"  #/16 is max allowed for a VPC
    app     = "10.0.1.0/20"  #/28 is min allowed for a VPC
    web     = "10.0.50.0/20" #only private IP ranges allowed in VPC
    private = "10.0.100.0/20"
    public  = "10.0.200.0/20"
  }
}
variable "AZ1" {
  description = "The availability zones used, #1"
  default     = "us-west-2a"
}
variable "AZ2" {
  description = "The availability zones used, #2"
  default     = "us-west-2b"
}
variable "AZ3" {
  description = "The availability zones used, #3"
  default     = "us-west-2c"
}
variable "AZ4" {
  description = "The availability zones used, #4"
  default     = "us-west-2d"
}
variable "IssuePublicIP" {
  description = "boolean to assign public IP to subnet devices or not"
  default     = false

}

variable "server_details" {
  server1 = {
    name           = "bastion_server",
    security_group = aws_security_group.ingress-all-test.id,
    subnets        = module.vpc.public_subnets[0]
  }
  server2 = {
    name           = "app_server",
    security_group = aws_security_group.ingress-internal.id,
    subnets        = module.vpc.private_subnets[0]
  }
  server3 = {
    name           = "web_server",
    security_group = aws_security_group.ingress-web.id,
    subnets        = module.vpc.public_subnets[1]
  }
}
