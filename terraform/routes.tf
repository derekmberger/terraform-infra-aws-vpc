################
# Route Tables #
################
resource "aws_route_table" "public_routes" {
  for_each = var.public_subnet_cidrs
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name     = "biotornic-${var.environment}-public-${substr(each.value, -1, -1)}",
    Exposure = "public"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# For production usage to have a NAT gateway in each subnet (HA)

# resource "aws_route_table" "private_routes" {
#   for_each = var.private_subnet_cidrs
#   vpc_id   = aws_vpc.vpc.id
#   tags = {
#     Name          = "biotornic-${var.environment}-private-${substr(each.value, -1, -1)}",
#     Exposure      = "private"
#   }

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.vpc_nats[each.value].id
#   }
# }

# All private routes use the same gateway (Single AZ NAT Gateway Model)
resource "aws_route_table" "private_routes" {
  for_each = var.private_subnet_cidrs

  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.shared_nat.id
  }
}

############################
# Route Table Associations #
############################
resource "aws_route_table_association" "public_route_table_association" {
  for_each       = aws_subnet.public_subnets
  route_table_id = aws_route_table.public_routes[each.key].id
  subnet_id      = aws_subnet.public_subnets[each.key].id
}

resource "aws_route_table_association" "private_route_table_association" {
  for_each       = aws_subnet.private_subnets
  route_table_id = aws_route_table.private_routes[each.key].id
  subnet_id      = aws_subnet.private_subnets[each.key].id
}
