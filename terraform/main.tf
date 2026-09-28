locals {
  common_tags = merge(
    {
      Project   = var.name_prefix
      ManagedBy = "Terraform"
      Purpose   = "self-hosted-renovate"
    },
    var.tags
  )
}

data "aws_caller_identity" "current" {}

data "tls_certificate" "github_actions" {
  url = "https://token.actions.githubusercontent.com"
}

module "github_oidc" {
  source = "./modules/github-oidc"

  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    data.tls_certificate.github_actions.certificates[0].sha1_fingerprint
  ]

  tags = local.common_tags
}

module "secrets_manager" {
  source = "./modules/secrets-manager"

  name = var.secret_name

  tags = local.common_tags
}

module "iam_role" {
  source = "./modules/iam-role"

  name_prefix       = var.name_prefix
  github_repository = var.github_repository
  github_branch     = var.github_branch
  oidc_provider_arn = module.github_oidc.arn
  secret_arn        = module.secrets_manager.arn

  tags = local.common_tags
}
