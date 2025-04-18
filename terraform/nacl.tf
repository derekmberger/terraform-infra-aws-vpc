#########
# NACLs #
#########
resource "aws_network_acl" "private_nacl" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = values(aws_subnet.private_subnets)[*].id

  ingress {
    from_port  = 0
    to_port    = 0
    icmp_code  = 0
    icmp_type  = 0
    rule_no    = 10000
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }

  egress {
    from_port  = 0
    to_port    = 0
    icmp_code  = 0
    icmp_type  = 0
    rule_no    = 10000
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_network_acl" "public_nacl" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = values(aws_subnet.public_subnets)[*].id

  ingress {
    from_port  = 0
    to_port    = 0
    icmp_code  = 0
    icmp_type  = 0
    rule_no    = 10000
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }

  egress {
    from_port  = 0
    to_port    = 0
    icmp_code  = 0
    icmp_type  = 0
    rule_no    = 10000
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }
}
