output "aws_account_id" {
  description = "AWS account ID used by this deployment."
  value       = data.aws_caller_identity.current.account_id
}

output "github_oidc_provider_arn" {
  description = "ARN of the GitHub Actions OIDC provider."
  value       = module.github_oidc.arn
}

output "renovate_role_arn" {
  description = "IAM role ARN assumed by GitHub Actions."
  value       = module.iam_role.role_arn
}

output "renovate_secret_arn" {
  description = "ARN of the Renovate GitHub App secret."
  value       = module.secrets_manager.arn
}

output "renovate_secret_name" {
  description = "Name of the Renovate GitHub App secret."
  value       = module.secrets_manager.name
}
