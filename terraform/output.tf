output "vpc" {
  value = aws_vpc.vpc
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.vpc.cidr_block
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = values(aws_subnet.private_subnets)[*].id
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = values(aws_subnet.private_subnets)[*].cidr_block
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = values(aws_subnet.public_subnets)[*].id
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = values(aws_subnet.public_subnets)[*].cidr_block
}

output "private_routing_tables" {
  description = "List of private routing table ids"
  value = values(aws_route_table.private_routes)[*].id
}

output "public_routing_tables" {
  description = "List of public routing table ids"
  value = values(aws_route_table.public_routes)[*].id
}
