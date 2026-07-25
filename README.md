# CloudForge AI Platform

![Version](https://img.shields.io/badge/version-v1.0-blue)

![AWS](https://img.shields.io/badge/AWS-EKS-orange)

![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)

![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-blue)

CloudForge AI Platform is an independent portfolio project I built to demonstrate how I design cloud-native AI infrastructure using AWS, Terraform, Kubernetes, GitHub Actions, and platform engineering practices.

The project focuses on building a production-style foundation for AI workloads, including secure networking, reusable Infrastructure as Code, Kubernetes deployment patterns, CI/CD automation, observability, and operational documentation.

> This is an independent portfolio project. It is not employer-owned code and does not contain confidential work artifacts.

## Author

Godfred Okpoti  
Senior AI Platform Engineer | Cloud Platform Engineer  
LinkedIn: https://www.linkedin.com/in/godfredokpoti-ai
## Architecture

Internet → AWS Load Balancer → NGINX Ingress → Amazon EKS → Platform API / Inference Service / Redis / PostgreSQL / Prometheus / Grafana

## Key Features

- Multi-AZ AWS networking
- Infrastructure as Code with Terraform
- Amazon EKS Kubernetes platform
- GitHub Actions CI/CD
- GitOps-ready architecture
- FastAPI platform service
- AI inference service
- Kubernetes RBAC
- Horizontal Pod Autoscaling
- Production-style documentation

## Technology Stack

- AWS: VPC, EKS, ECR, IAM, CloudWatch, S3, DynamoDB
- IaC: Terraform
- Kubernetes: Namespaces, RBAC, Deployments, Services, Ingress, HPA
- CI/CD: GitHub Actions
- App: Python, FastAPI
- Observability: Prometheus, Grafana, OpenTelemetry-ready structure

## Repository Structure

```text
.github/workflows/        CI/CD workflows
terraform/bootstrap/      Remote state backend
terraform/modules/        Reusable Terraform modules
terraform/environments/   Environment configurations
kubernetes/               Kubernetes manifests
services/                 FastAPI services
docs/                     Architecture, deployment, operations, security
scripts/                  Helper scripts
```

## Quick Start

### 1. Configure AWS

```bash
aws configure
```

### 2. Bootstrap Terraform backend

```bash
cd terraform/bootstrap
terraform init
terraform fmt
terraform validate
terraform apply
```

### 3. Deploy development infrastructure

Edit `terraform/environments/dev/backend.tf` and replace bucket/table names if needed.

```bash
cd ../environments/dev
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

### 4. Build and run the app locally

```bash
cd ../../../services/platform-api
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

### 5. Deploy Kubernetes manifests

```bash
kubectl apply -f kubernetes/namespaces/
kubectl apply -f kubernetes/rbac/
kubectl apply -f kubernetes/base/
kubectl apply -f kubernetes/ingress/
```

## Roadmap

- Add Argo CD application manifests
- Add External Secrets integration
- Add Terraform ECR module
- Add Grafana dashboards
- Add OpenTelemetry traces
- Add staging and production environments
