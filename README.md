# Renovate AWS Demo

Self-hosted Renovate running through GitHub Actions with secure AWS authentication.

## Architecture

GitHub Actions
    |
    | GitHub OIDC
    v
AWS IAM Role
    |
    | secretsmanager:GetSecretValue
    v
AWS Secrets Manager
    |
    | GitHub App credentials
    v
GitHub App
    |
    v
Renovate
    |
    v
Dependency Update PR

## Components

- GitHub Actions
- GitHub OIDC
- AWS IAM
- AWS Secrets Manager
- GitHub App
- Renovate
- Terraform

## Security Principles

- No long-lived AWS access keys
- No GitHub Personal Access Token
- No GitHub App private key in Git
- GitHub Actions authenticates using OIDC
- IAM role is restricted to the intended GitHub repository
- IAM permissions are restricted to `secretsmanager:GetSecretValue`
- GitHub App credentials are stored in AWS Secrets Manager
- Secrets are not stored in repository files
- GitHub App access is limited to the required repository

## Repository Structure

```text
.github/workflows/
├── renovate.yml
└── validate.yml

demo/
└── package.json

examples/
└── renovate-github-app-secret.example.json

scripts/
├── validate_json.py
└── validate_yaml.py

terraform/
├── modules/
│   ├── github-oidc/
│   ├── iam-role/
│   └── secrets-manager/
│
└── environments/
    └── demo/
