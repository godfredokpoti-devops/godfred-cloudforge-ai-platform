# Security Policy

## Overview

CloudForge AI Platform is an independent portfolio project demonstrating production-style cloud platform engineering using AWS, Terraform, Kubernetes, GitOps, CI/CD, and modern AI infrastructure practices.

Security is considered throughout the entire platform design.

---

## Supported Versions

| Version | Supported |
|----------|-----------|
| 1.x      | ✅ Yes |
| < 1.0    | ❌ No |

---

## Reporting Security Issues

If you discover a security vulnerability, please do not disclose it publicly.

Instead, report it privately by contacting:

**Godfred Okpoti**

Please include:

- Description of the issue
- Steps to reproduce
- Potential impact
- Suggested remediation (if known)

---

## Security Principles

This project follows several security best practices:

- Principle of Least Privilege
- Infrastructure as Code
- Private Kubernetes worker nodes
- IAM role separation
- Encrypted Terraform state
- No secrets committed to source control
- Kubernetes RBAC
- Secure networking
- Version-controlled infrastructure

---

## Secrets Management

Never commit:

- AWS Access Keys
- IAM credentials
- Terraform state files
- `.env` files
- SSH private keys
- Kubernetes Secrets containing production credentials

---

## Future Improvements

Planned enhancements include:

- GitHub OIDC authentication
- AWS Secrets Manager integration
- External Secrets Operator
- Trivy image scanning
- Checkov Terraform scanning
- cert-manager TLS automation
- OpenTelemetry security monitoring