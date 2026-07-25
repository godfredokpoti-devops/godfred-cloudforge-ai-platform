variable "cluster_name" {
  description = "Name of the Amazon EKS cluster."
  type        = string

  validation {
    condition = (
      length(var.cluster_name) >= 3 &&
      length(var.cluster_name) <= 100 &&
      can(regex("^[A-Za-z0-9][A-Za-z0-9_-]*$", var.cluster_name))
    )
    error_message = "The cluster name must be 3-100 characters and contain only letters, numbers, hyphens, or underscores."
  }
}

variable "vpc_id" {
  description = "ID of the VPC where the EKS cluster will be deployed."
  type        = string

  validation {
    condition     = can(regex("^vpc-[a-zA-Z0-9]+$", var.vpc_id))
    error_message = "The VPC ID must use a valid format such as vpc-0123456789abcdef0."
  }
}

variable "private_subnet_ids" {
  description = "Private subnet IDs used by the EKS control plane and managed node group."
  type        = list(string)

  validation {
    condition = (
      length(var.private_subnet_ids) >= 2 &&
      alltrue([
        for subnet_id in var.private_subnet_ids :
        can(regex("^subnet-[a-zA-Z0-9]+$", subnet_id))
      ])
    )
    error_message = "Provide at least two valid private subnet IDs for multi-Availability Zone deployment."
  }
}

variable "kubernetes_version" {
  description = "Kubernetes minor version used by the EKS cluster."
  type        = string
  default     = "1.35"

  validation {
    condition     = can(regex("^1\\.[0-9]{2}$", var.kubernetes_version))
    error_message = "The Kubernetes version must use a minor-version format such as 1.35."
  }
}

variable "endpoint_private_access" {
  description = "Whether the EKS Kubernetes API endpoint is accessible from within the VPC."
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Whether the EKS Kubernetes API endpoint is accessible from outside the VPC."
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "CIDR blocks permitted to reach the public EKS Kubernetes API endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]

  validation {
    condition = alltrue([
      for cidr in var.public_access_cidrs :
      can(cidrnetmask(cidr))
    ])
    error_message = "Every public-access entry must be a valid IPv4 CIDR block."
  }
}

variable "enabled_cluster_log_types" {
  description = "EKS control-plane log types sent to Amazon CloudWatch Logs."
  type        = list(string)

  default = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  validation {
    condition = alltrue([
      for log_type in var.enabled_cluster_log_types :
      contains(
        [
          "api",
          "audit",
          "authenticator",
          "controllerManager",
          "scheduler"
        ],
        log_type
      )
    ])
    error_message = "Unsupported EKS control-plane log type provided."
  }
}

variable "node_instance_types" {
  description = "EC2 instance types used by the EKS managed node group."
  type        = list(string)
  default     = ["t3.medium"]

  validation {
    condition     = length(var.node_instance_types) > 0
    error_message = "At least one node instance type must be provided."
  }
}

variable "node_capacity_type" {
  description = "Capacity type used by the managed node group."
  type        = string
  default     = "ON_DEMAND"

  validation {
    condition     = contains(["ON_DEMAND", "SPOT"], var.node_capacity_type)
    error_message = "The node capacity type must be ON_DEMAND or SPOT."
  }
}

variable "node_desired_size" {
  description = "Desired number of worker nodes."
  type        = number
  default     = 2

  validation {
    condition     = var.node_desired_size >= 1
    error_message = "The desired node count must be at least one."
  }
}

variable "node_min_size" {
  description = "Minimum number of worker nodes."
  type        = number
  default     = 1

  validation {
    condition     = var.node_min_size >= 1
    error_message = "The minimum node count must be at least one."
  }
}

variable "node_max_size" {
  description = "Maximum number of worker nodes."
  type        = number
  default     = 3

  validation {
    condition     = var.node_max_size >= var.node_min_size
    error_message = "The maximum node count must be greater than or equal to the minimum node count."
  }
}

variable "node_disk_size" {
  description = "Disk size in GiB allocated to each worker node."
  type        = number
  default     = 50

  validation {
    condition     = var.node_disk_size >= 20
    error_message = "The worker-node disk size must be at least 20 GiB."
  }
}

variable "tags" {
  description = "Common tags applied to EKS and supporting AWS resources."
  type        = map(string)
  default     = {}
}