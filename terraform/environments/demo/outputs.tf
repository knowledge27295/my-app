output "renovate_role_arn" {
  description = "IAM role ARN used by GitHub Actions."
  value       = module.renovate.renovate_role_arn
}

output "renovate_secret_arn" {
  description = "AWS Secrets Manager secret ARN."
  value       = module.renovate.renovate_secret_arn
}

output "renovate_secret_name" {
  description = "AWS Secrets Manager secret name."
  value       = module.renovate.renovate_secret_name
}

output "github_oidc_provider_arn" {
  description = "GitHub Actions OIDC provider ARN."
  value       = module.renovate.github_oidc_provider_arn
}
