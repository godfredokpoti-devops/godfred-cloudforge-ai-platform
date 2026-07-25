output "cluster_name" {
  description = "Name of the Amazon EKS cluster."
  value       = aws_eks_cluster.this.name
}

output "cluster_arn" {
  description = "Amazon Resource Name of the EKS cluster."
  value       = aws_eks_cluster.this.arn
}

output "cluster_endpoint" {
  description = "Endpoint used to connect to the Kubernetes API server."
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64-encoded certificate authority data required to authenticate with the Kubernetes API."
  value       = aws_eks_cluster.this.certificate_authority[0].data
  sensitive   = true
}

output "cluster_security_group_id" {
  description = "ID of the additional security group associated with the EKS cluster."
  value       = aws_security_group.cluster.id
}

output "cluster_iam_role_arn" {
  description = "ARN of the IAM role used by the EKS control plane."
  value       = aws_iam_role.cluster.arn
}

output "node_group_name" {
  description = "Name of the EKS managed node group."
  value       = aws_eks_node_group.default.node_group_name
}

output "node_group_arn" {
  description = "ARN of the EKS managed node group."
  value       = aws_eks_node_group.default.arn
}

output "node_iam_role_arn" {
  description = "ARN of the IAM role used by the EKS worker nodes."
  value       = aws_iam_role.node.arn
}

output "oidc_issuer_url" {
  description = "OpenID Connect issuer URL for the EKS cluster."
  value       = aws_eks_cluster.this.identity[0].oidc[0].issuer
}