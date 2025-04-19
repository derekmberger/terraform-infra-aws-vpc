###############
# Elastic IPs #
###############
# For production usage to have a NAT gateway in each subnet (HA)
# resource "aws_eip" "nat_eips" {
#   for_each = local.public_cidr_by_az
#   domain   = "vpc"
# }

# Single Elastic IP for shared NAT gateway model
resource "aws_eip" "shared_nat_eip" {
  domain = "vpc"
}
