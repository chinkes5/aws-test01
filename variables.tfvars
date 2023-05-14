userName = "jchinkes@home.com"
Env      = "Dev"
cidr_ranges = {
  main    = "10.0.0.0/16"  #/16 is max allowed for a VPC
  app     = "10.0.1.0/20"  #/28 is min allowed for a VPC
  web     = "10.0.50.0/20" #only private IP ranges allowed in VPC
  private = "10.0.100.0/20"
  public  = "10.0.200.0/20"
}
vpc = {
  azs = [
    "us-west-2a",
    "us-west-2b",
    "us-west-2c"
  ]
  private_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
  public_subnets = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24"
  ]
}
sg_details = {
  allow_all_sg = {
    description             = "Allow all other groups in on port 22"
    ingress_cidr_blocks     = ["0.0.0.0/0"]
    ingress_security_groups = null
    ingress_from_port       = 22
    ingress_to_port         = 22
    ingress_protocol        = "tcp"
    egress_cidr_blocks      = null
    egress_security_groups  = null
    egress_from_port        = 0
    egress_to_port          = 0
    egress_protocol         = "-1"
    egress_cidr_blocks      = ["0.0.0.0/0"]
  }
  allow_web = {
    description             = "Allow internet in on port 80"
    ingress_cidr_blocks     = ["0.0.0.0/0"]
    ingress_security_groups = null
    ingress_from_port       = 80
    ingress_to_port         = 80
    ingress_protocol        = "tcp"
    egress_cidr_blocks      = null
    egress_security_groups  = null
    egress_from_port        = 0
    egress_to_port          = 0
    egress_protocol         = "-1"
    egress_cidr_blocks      = ["0.0.0.0/0"]
  }
  allow_internal_ssh = {
    description             = "Allow internal groups in on port 22"
    ingress_cidr_blocks     = null
    ingress_security_groups = ["value"] #,aws_security_group.ingress-all-test.id]
    ingress_from_port       = 22
    ingress_to_port         = 22
    ingress_protocol        = "tcp"
    egress_cidr_blocks      = null
    egress_security_groups  = null
    egress_from_port        = 0
    egress_to_port          = 0
    egress_protocol         = "-1"
    egress_cidr_blocks      = ["0.0.0.0/0"]
  }
}

server_details = {
  bastion_server = {
    description     = "Bastion server to allow ingress via"
    instance_type   = "t2.micro"
    ami_id          = "ami-013a129d325529d4d"
    ami_key_name    = "Chinkes-Food_02"
    IssuePublicIP   = false
    security_group  = ["allow_all_sg"]
    private_subnets = true
  }
  app_server = {
    description     = "Application server"
    instance_type   = "t2.micro"
    ami_id          = "ami-013a129d325529d4d"
    ami_key_name    = "Chinkes-Food_02"
    IssuePublicIP   = false
    security_group  = ["allow_internal_ssh"]
    private_subnets = true
  }
  web_server = {
    description     = "Web server"
    instance_type   = "t2.micro"
    ami_id          = "ami-013a129d325529d4d"
    ami_key_name    = "Chinkes-Food_02"
    IssuePublicIP   = false
    security_group  = ["allow_web", "allow_internal_ssh"]
    private_subnets = false
  }
}
