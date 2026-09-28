# AWS Setup

## Overview

This document explains how to deploy the AWS infrastructure required for the self-hosted Renovate demo.

The AWS architecture is:

GitHub Actions
    |
    | GitHub OIDC
    v
AWS IAM OIDC Provider
    |
    v
AWS IAM Role
    |
    | secretsmanager:GetSecretValue
    v
AWS Secrets Manager
    |
    v
Renovate GitHub App credentials

---

## Prerequisites

Before deploying the infrastructure, make sure the following are available:

- AWS account
- AWS CLI
- Terraform >= 1.6
- GitHub repository
- GitHub App
- GitHub App installation
- Appropriate AWS permissions for Terraform deployment

---

## AWS Region

The demo uses:

```text
ap-south-1
