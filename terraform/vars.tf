##############################
# Standard Project Variables #
##############################
variable "aws_region" {
  description = "The main AWS region to deploy the resources into"
  type        = string
  default     = "us-east-1"
}

variable "region_code" {
  description = "The region code to use for resources"
  type        = string
  default     = "use1"
}

variable "environment" {
  description = "The type of environment to provision"
  type        = string
}

variable "tfc_workspace_name" {
  description = "The TFC current workspace name"
  type        = string
}

variable "vcs_repo" {
  description = "The org/name of the repo used"
  type        = string
}

variable "org_name" {
  description = "The organization prefix"
  type        = string
  default     = "biotronic"
}

############################
# Custom Project Variables #
############################
variable "vpc_cidr" {
  type = string
}

variable "private_subnet_cidrs" {
  description = "A list of CIDR ranges to use for private subnets"
  type        = map(string)
  default     = {}
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR ranges to use for public subnets"
  type        = map(string)
  default     = {}
}
