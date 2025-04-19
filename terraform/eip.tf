###############
# Elastic IPs #
###############
resource "aws_eip" "nat_eips" {
  for_each = var.public_subnet_cidrs
  domain   = "vpc"
}
