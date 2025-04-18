####################
# Project Variables #
#####################
resource "tfe_variable" "aws_region" {
  category     = "terraform"
  key          = "aws_region"
  value        = var.aws_region
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "region_code" {
  category     = "terraform"
  key          = "region_code"
  value        = var.region_code
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "environment" {
  category     = "terraform"
  key          = "environment"
  value        = var.environment
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "tfc_workspace_name" {
  category     = "terraform"
  key          = "tfc_workspace_name"
  value        = tfe_workspace.workspace.name
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "vcs_repo" {
  category     = "terraform"
  key          = "vcs_repo"
  value        = var.vcs_repo
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "org_name" {
  category     = "terraform"
  key          = "org_name"
  value        = var.org_name
  workspace_id = tfe_workspace.workspace.id
}

############################
# Custom Project Variables #
############################
resource "tfe_variable" "vpc_cidr" {
  category     = "terraform"
  key          = "vpc_cidr"
  value        = var.vpc_cidr
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "public_subnet_cidrs" {
  category     = "terraform"
  key          = "public_subnet_cidrs"
  value        = var.public_subnet_cidrs
  workspace_id = tfe_workspace.workspace.id
  hcl          = true
}

resource "tfe_variable" "private_subnet_cidrs" {
  category     = "terraform"
  key          = "private_subnet_cidrs"
  value        = var.private_subnet_cidrs
  workspace_id = tfe_workspace.workspace.id
  hcl          = true
}
