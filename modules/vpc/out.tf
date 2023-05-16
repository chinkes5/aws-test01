output "tags" {
  value = var.tags
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.default.id
}

# Outputs the id of the subnet you created in the module
# output "subnet_id" {
#   value = aws_subnet.default.id
# }

# output "private_subnets" {
#   description = "List of IDs of private subnets"
#   value       = aws_vpc.default.private_subnets
# }

# output "public_subnets" {
#   description = "List of IDs of public subnets"
#   value       = aws_vpc.default.public_subnets
# }
