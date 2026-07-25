# Operations Runbook

## Check cluster access

```bash
aws eks update-kubeconfig --name cloudforge-ai-platform-dev --region us-east-1
kubectl get nodes
```

## Check application status

```bash
kubectl get pods -n platform
kubectl get svc -n platform
kubectl logs -n platform deploy/platform-api
```

## Common Issues

### Pods stuck in ImagePullBackOff
- Confirm image exists in ECR.
- Confirm node IAM role can read ECR.
- Confirm image tag is correct.

### Ingress not reachable
- Confirm ingress controller is installed.
- Confirm DNS points to the load balancer.
- Confirm security groups allow traffic.
