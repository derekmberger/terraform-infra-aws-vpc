provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      org           = var.org_name           # e.g. "biotornic"
      environment   = var.environment        # e.g. "prod"
      region        = var.aws_region         # e.g. "us‑east‑1"
      tfc_workspace = var.tfc_workspace_name # the TFC workspace name
      vcs_repo      = var.vcs_repo           # the VCS org/name
    }
  }
}

terraform {
  required_providers {
    aws = {
      version = "~> 5.0"
    }
  }
}
