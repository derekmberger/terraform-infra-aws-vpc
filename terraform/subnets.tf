###########
# Subnets #
###########
resource "aws_subnet" "private_subnets" {
  for_each                = var.private_subnet_cidrs
  cidr_block              = each.key
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = each.value
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.org_name}-${var.environment}-private-${local.az_suffix_map[each.value]}"
    Role = "private-subnet"
    AZ   = each.value
  }
}

resource "aws_subnet" "public_subnets" {
  for_each                = var.public_subnet_cidrs
  cidr_block              = each.key
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = each.value
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.org_name}-${var.environment}-private-${local.az_suffix_map[each.value]}"
    Role = "private-subnet"
    AZ   = each.value
  }
}
