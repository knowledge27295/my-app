variable "url" {
  description = "GitHub Actions OIDC issuer URL."
  type        = string
}

variable "client_id_list" {
  description = "OIDC audience values."
  type        = list(string)
}

variable "thumbprint_list" {
  description = "OIDC certificate thumbprints."
  type        = list(string)
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default     = {}
}

resource "aws_iam_openid_connect_provider" "this" {
  url             = var.url
  client_id_list  = var.client_id_list
  thumbprint_list = var.thumbprint_list
  tags            = var.tags
}

output "arn" {
  description = "GitHub Actions OIDC provider ARN."
  value       = aws_iam_openid_connect_provider.this.arn
}
