# Networking Deployment Guide

## CIDR Design

- VPC: 10.20.0.0/16
- Public Subnets:
  - 10.20.1.0/24
  - 10.20.2.0/24
- Private Subnets:
  - 10.20.11.0/24
  - 10.20.12.0/24

## Deployment

```bash
cd terraform/bootstrap
terraform init
terraform apply
```

Then deploy the dev environment:

```bash
cd ../environments/dev
terraform init
terraform plan
terraform apply
```

## Security Notes

- Public subnets host load balancer-facing resources.
- Private subnets host Kubernetes worker nodes.
- NAT Gateway allows controlled outbound access.
- Terraform state is encrypted and versioned.
