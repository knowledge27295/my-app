variable "aws_region" {
  type        = string
  description = "AWS region."
}

variable "github_repository" {
  type        = string
  description = "GitHub repository in OWNER/REPOSITORY format."
}

variable "github_branch" {
  type        = string
  description = "GitHub branch used by the workflow."
}

variable "name_prefix" {
  type        = string
  description = "AWS resource name prefix."
}

variable "secret_name" {
  type        = string
  description = "AWS Secrets Manager secret name."
}

variable "tags" {
  type        = map(string)
  description = "AWS resource tags."
}
