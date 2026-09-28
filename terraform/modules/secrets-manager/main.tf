variable "name" {
  description = "AWS Secrets Manager secret name."
  type        = string
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default     = {}
}

resource "aws_secretsmanager_secret" "this" {
  name = var.name

  description = "GitHub App credentials for self-hosted Renovate."

  recovery_window_in_days = 7

  tags = var.tags
}

output "arn" {
  description = "AWS Secrets Manager secret ARN."
  value       = aws_secretsmanager_secret.this.arn
}

output "name" {
  description = "AWS Secrets Manager secret name."
  value       = aws_secretsmanager_secret.this.name
}
