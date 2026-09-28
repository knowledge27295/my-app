variable "aws_region" {
  description = "AWS region for the Renovate demo."
  type        = string
  default     = "ap-southeast-1"
}

variable "github_repository" {
  description = "GitHub repository in OWNER/REPOSITORY format."
  type        = string

  validation {
    condition     = can(regex("^[^/]+/[^/]+$", var.github_repository))
    error_message = "Use OWNER/REPOSITORY format."
  }
}

variable "github_branch" {
  description = "GitHub branch allowed to assume the IAM role."
  type        = string
  default     = "main"
}

variable "name_prefix" {
  description = "AWS resource name prefix."
  type        = string
  default     = "renovate-demo"
}

variable "secret_name" {
  description = "AWS Secrets Manager secret name."
  type        = string
  default     = "renovate/github-app"
}

variable "tags" {
  description = "Additional AWS resource tags."
  type        = map(string)
  default     = {}
}
