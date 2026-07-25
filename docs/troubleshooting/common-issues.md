# Common Issues

## Terraform backend bucket already exists

S3 bucket names are globally unique. Change `state_bucket_name` in `terraform/bootstrap/variables.tf`.

## EKS creation takes a long time

EKS clusters and managed node groups may take 10–20 minutes.

## kubectl cannot connect

Run:

```bash
aws eks update-kubeconfig --name cloudforge-ai-platform-dev --region us-east-1
```
