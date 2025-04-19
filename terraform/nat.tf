#################
# NAT Resources #
#################
# For production usage to have a NAT gateway in each subnet (HA)
# resource "aws_nat_gateway" "vpc_nats" {
#   for_each          = local.public_cidr_by_az
#   allocation_id     = aws_eip.nat_eips[each.key].id   # key = AZ
#   subnet_id         = aws_subnet.public_subnets[each.value].id  # value = CIDR
#   connectivity_type = "public"
# }

# Single NAT Gateway in the first AZ
resource "aws_nat_gateway" "shared_nat" {
  allocation_id     = aws_eip.shared_nat_eip.id
  subnet_id         = aws_subnet.public_subnets[local.first_public_cidr].id
  connectivity_type = "public"
}
