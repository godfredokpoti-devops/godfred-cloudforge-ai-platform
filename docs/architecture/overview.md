# Architecture Overview

CloudForge AI Platform is a portfolio-grade platform engineering project.

## Main Components

- AWS VPC for isolated networking
- EKS for Kubernetes orchestration
- ECR for container images
- FastAPI platform service
- Demo inference service
- Kubernetes RBAC and namespace isolation
- GitHub Actions for validation and builds
- Argo CD-ready GitOps structure
- Prometheus/Grafana-ready monitoring structure

## Design Principles

1. Infrastructure is version controlled.
2. Cloud resources are reusable through Terraform modules.
3. Application workloads run in Kubernetes.
4. CI/CD validates infrastructure and application builds.
5. Documentation explains engineering decisions.
