# Print out the private ip of the EC2 instance that will be created using this module
/* output "PrivateIP" {
  description = "Private IP of EC2 instance"
  value       = aws_instance.my-instance.private_ip
} */

output "vpc_stuff" {
  value = var.vpc
}

output "user" {
  value = var.userName
}

output "environment" {
  value = var.Env
}

output "region" {
  value = var.region
}

output "security_group" {
  value = var.sg_details.allow_all_sg
}

output "server_details" {
  value = var.server_details.bastion_server
}