# Security

## Overview

This project is designed to run self-hosted Renovate securely using GitHub Actions, GitHub OIDC, AWS IAM, AWS Secrets Manager, and a GitHub App.

## Authentication

GitHub Actions authenticates to AWS using GitHub OIDC.

No long-lived AWS access keys are stored in GitHub.

The authentication flow is:

GitHub Actions
    |
    | GitHub OIDC
    v
AWS IAM Role
    |
    v
AWS Secrets Manager
    |
    v
Renovate

## AWS IAM

The Renovate IAM role follows the principle of least privilege.

The role is allowed to:

```text
secretsmanager:GetSecretValue
