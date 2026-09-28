terraform {
  backend "local" {}
}

provider "aws" {
  region = var.aws_region
}

provider "tls" {}

module "renovate" {
  source = "../.."

  aws_region        = var.aws_region
  github_repository = var.github_repository
  github_branch     = var.github_branch
  name_prefix       = var.name_prefix
  secret_name       = var.secret_name
  tags              = var.tags
}
