output "repository_urls" {
  description = "Map of repository names to their ECR repository URLs."
  value = {
    for name, repo in aws_ecr_repository.this :
    name => repo.repository_url
  }
}

output "repository_arns" {
  description = "Map of repository names to their Amazon Resource Names (ARNs)."
  value = {
    for name, repo in aws_ecr_repository.this :
    name => repo.arn
  }
}

output "repository_names" {
  description = "Names of all ECR repositories created by this module."
  value = [
    for repo in aws_ecr_repository.this :
    repo.name
  ]
}