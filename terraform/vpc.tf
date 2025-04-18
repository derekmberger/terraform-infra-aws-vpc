#######
# VPC #
#######
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"
}

# resource "aws_flow_log" "vpc_flow_logs" {
#   log_destination      = data.terraform_remote_state.security_account_remote_state.outputs.flow_logs_bucket.arn
#   log_destination_type = "s3"
#   traffic_type         = "ALL"
#   vpc_id               = aws_vpc.vpc.id

#   destination_options {
#     file_format                = "parquet"
#     per_hour_partition         = true
#     hive_compatible_partitions = true
#   }
# }
