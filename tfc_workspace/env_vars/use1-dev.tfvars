##############################
# Standard Project Variables #
##############################
vcs_branch        = "main"
aws_region        = "us-east-1"
environment       = "dev"

############################
# Custom Project Variables #
############################
vpc_cidr       = "10.100.0.0/16"
public_subnet_cidrs = <<HERE
{
  "10.100.0.0/24" = "us-east-1a"
  "10.100.1.0/24" = "us-east-1b"
  "10.100.2.0/24" = "us-east-1c"
}
HERE

private_subnet_cidrs = <<HERE
{
  "10.100.4.0/24" = "us-east-1a"
  "10.100.5.0/24" = "us-east-1b"
  "10.100.6.0/24" = "us-east-1c"
}
HERE

