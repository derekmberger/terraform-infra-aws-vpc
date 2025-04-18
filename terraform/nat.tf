#################
# NAT Resources #
#################
resource "aws_nat_gateway" "vpc_nats" {
  for_each          = var.public_subnet_cidrs
  allocation_id     = aws_eip.nat_eips[each.key].id
  connectivity_type = "public"
  subnet_id         = aws_subnet.public_subnets[each.key].id
}
