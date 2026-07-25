# Design Decisions

## Why Terraform

I used Terraform because it allows the cloud infrastructure to be version-controlled, repeatable, and reusable across environments.

## Why Amazon EKS

I selected Amazon EKS to demonstrate Kubernetes-based platform engineering for containerized AI and cloud-native workloads.

## Why private subnets for worker nodes

Worker nodes are placed in private subnets to reduce public exposure and follow a more secure production-style network design.

## Why GitHub Actions

GitHub Actions provides a simple CI/CD workflow for validating Terraform, building containers, and preparing deployment automation.

## Why FastAPI

FastAPI was selected because it is lightweight, production-friendly, and commonly used for modern API and AI service development.

## Future Improvements

- Add Helm charts
- Add Argo CD full deployment
- Add External Secrets Operator
- Add Prometheus and Grafana dashboards
- Add OpenTelemetry tracing
- Add security scanning with Trivy