# Security Model

## Current Controls

- Encrypted Terraform state
- DynamoDB state locking
- Private EKS worker node subnets
- IAM roles for EKS cluster and nodes
- Kubernetes namespace isolation
- Kubernetes RBAC
- Container image scanning in ECR
- Public access blocked on state bucket

## Future Improvements

- AWS IAM Roles for Service Accounts
- External Secrets Operator
- AWS Secrets Manager
- cert-manager TLS automation
- OPA/Gatekeeper policies
- Trivy image scanning in CI
