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
    Name          = "biotornic-${var.environment}-private-${substr(each.value, -1, -1)}",
    Exposure      = "private"
  }
}

resource "aws_subnet" "public_subnets" {
  for_each                = var.public_subnet_cidrs
  cidr_block              = each.key
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = each.value
  map_public_ip_on_launch = true
  tags = {
    Name          = "biotornic-${var.environment}-public-${substr(each.value, -1, -1)}",
    Exposure      = "public"
  }
}
