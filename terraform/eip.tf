###############
# Elastic IPs #
###############
resource "aws_eip" "nat_eips" {
  for_each = var.private_subnet_cidrs
  domain   = "vpc"
}
