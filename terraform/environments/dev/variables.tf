variable "aws_region" {
  description = "AWS Region where the development environment will be deployed."
  type        = string
  default     = "us-east-1"

  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]+$", var.aws_region))
    error_message = "The AWS Region must use a valid format, such as us-east-1."
  }
}

variable "project_name" {
  description = "Base name used to identify CloudForge AI Platform resources."
  type        = string
  default     = "cloudforge-ai-platform"

  validation {
    condition = (
      length(var.project_name) >= 3 &&
      length(var.project_name) <= 40 &&
      can(regex("^[a-z0-9-]+$", var.project_name))
    )
    error_message = "The project name must be 3-40 characters and contain only lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "stage", "prod"], var.environment)
    error_message = "The environment must be one of: dev, test, stage, or prod."
  }
}

variable "eks_public_access_cidrs" {
  description = "CIDR blocks allowed to access the public EKS Kubernetes API endpoint."
  type        = list(string)

  validation {
    condition = alltrue([
      for cidr in var.eks_public_access_cidrs :
      can(cidrnetmask(cidr))
    ])
    error_message = "Every EKS public-access entry must be a valid IPv4 CIDR block."
  }
}