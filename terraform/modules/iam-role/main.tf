variable "name_prefix" {
  type        = string
  description = "IAM role name prefix."
}

variable "github_repository" {
  type        = string
  description = "GitHub repository in OWNER/REPOSITORY format."
}

variable "github_branch" {
  type        = string
  description = "GitHub branch allowed to assume the IAM role."
}

variable "oidc_provider_arn" {
  type        = string
  description = "GitHub Actions OIDC provider ARN."
}

variable "secret_arn" {
  type        = string
  description = "AWS Secrets Manager secret ARN."
}

variable "tags" {
  type        = map(string)
  description = "IAM role tags."
  default     = {}
}

locals {
  role_name = "${var.name_prefix}-github-actions"
}

data "aws_iam_policy_document" "trust" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type = "Federated"

      identifiers = [
        var.oidc_provider_arn
      ]
    }

    condition {
      test = "StringEquals"

      variable = "token.actions.githubusercontent.com:aud"

      values = [
        "sts.amazonaws.com"
      ]
    }

    condition {
      test = "StringEquals"

      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "repo:${var.github_repository}:ref:refs/heads/${var.github_branch}"
      ]
    }
  }
}

resource "aws_iam_role" "this" {
  name = local.role_name

  assume_role_policy = data.aws_iam_policy_document.trust.json

  max_session_duration = 3600

  tags = var.tags
}

data "aws_iam_policy_document" "permissions" {
  statement {
    effect = "Allow"

    actions = [
      "secretsmanager:GetSecretValue"
    ]

    resources = [
      var.secret_arn
    ]
  }
}

resource "aws_iam_role_policy" "this" {
  name = "${local.role_name}-secret-read"

  role = aws_iam_role.this.id

  policy = data.aws_iam_policy_document.permissions.json
}

output "role_arn" {
  description = "IAM role ARN assumed by GitHub Actions."
  value       = aws_iam_role.this.arn
}
