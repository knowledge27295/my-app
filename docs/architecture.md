# Architecture

## Overview

This project is a secure self-hosted Renovate demo using GitHub, GitHub Actions, GitHub OIDC, AWS IAM, AWS STS, AWS Secrets Manager, and a GitHub App.

The AWS implementation is a proof of concept for an eventual GCP implementation.

The primary authentication and secret-management flow is:

GitHub Actions OIDC
        |
        v
AWS IAM Role
        |
        v
AWS Secrets Manager
        |
        v
GitHub App credentials
        |
        v
Renovate

The Renovate and GitHub architecture is intended to remain unchanged when the cloud authentication and secret-management layer is later migrated to GCP.

---

## Architecture Diagram

```text
                         GitHub
                            |
                            |
                       GitHub App
                            |
                            v
                   GitHub Repository
                            |
                            |
                     GitHub Actions
                            |
                            | OIDC
                            v
                       AWS IAM
                            |
                            | AssumeRoleWithWebIdentity
                            v
                    AWS IAM Role
                            |
                            | GetSecretValue
                            v
                 AWS Secrets Manager
                            |
                            | GitHub App credentials
                            v
                        Renovate
                            |
                            | GitHub API
                            v
                         GitHub
                            |
                            v
                  Renovate Pull Requests
