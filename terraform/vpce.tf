#################
# VPC Endpoints #
#################
# resource "aws_vpc_endpoint" "s3" {
#   vpc_id            = aws_vpc.vpc.id
#   service_name      = "com.amazonaws.${var.aws_region}.s3"
#   route_table_ids   = concat(values(aws_route_table.private_routes)[*].id, values(aws_route_table.public_routes)[*].id)
#   vpc_endpoint_type = "Gateway"
# }
