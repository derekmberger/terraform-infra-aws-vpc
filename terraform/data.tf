######################
# AWS Data Providers #
######################
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_account_alias" "current" {}

###############################
# TFC Workspace Data Provider #
###############################
data "terraform_remote_state" "security_account_remote_state" {
  backend = "remote"

  config = {
    organization = "biotornic"
    workspaces = {
      name = var.security_account_tfc_workspace_name
    }
  }
}
