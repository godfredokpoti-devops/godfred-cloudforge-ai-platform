output "vpc_id" {
  description = "ID of the development VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets in the development environment."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets used by the EKS cluster and worker nodes."
  value       = module.vpc.private_subnet_ids
}

output "eks_cluster_name" {
  description = "Name of the Amazon EKS cluster."
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Kubernetes API endpoint for the Amazon EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_security_group_id" {
  description = "ID of the security group associated with the EKS cluster."
  value       = module.eks.cluster_security_group_id
}

output "eks_node_group_name" {
  description = "Name of the EKS managed node group."
  value       = module.eks.node_group_name
}

output "ecr_repository_urls" {
  description = "Map of ECR repository names to repository URLs."
  value       = module.ecr.repository_urls
}

output "ecr_repository_arns" {
  description = "Map of ECR repository names to repository ARNs."
  value       = module.ecr.repository_arns
}