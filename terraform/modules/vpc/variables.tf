variable "name" {
  description = "Name prefix used for all VPC resources."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) >= 3
    error_message = "The name must contain at least three non-space characters."
  }
}

variable "cidr_block" {
  description = "IPv4 CIDR block assigned to the VPC."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.cidr_block))
    error_message = "The VPC CIDR block must be a valid IPv4 CIDR, such as 10.20.0.0/16."
  }
}

variable "availability_zones" {
  description = "Availability Zones used for public and private subnet placement."
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) >= 2
    error_message = "At least two Availability Zones must be provided for high availability."
  }

  validation {
    condition = (
      length(var.availability_zones) == length(var.public_subnet_cidrs) &&
      length(var.availability_zones) == length(var.private_subnet_cidrs)
    )
    error_message = "The Availability Zone, public subnet CIDR, and private subnet CIDR lists must contain the same number of entries."
  }
}

variable "public_subnet_cidrs" {
  description = "IPv4 CIDR blocks assigned to public subnets."
  type        = list(string)

  validation {
    condition = alltrue([
      for cidr in var.public_subnet_cidrs : can(cidrnetmask(cidr))
    ])
    error_message = "Every public subnet CIDR must be a valid IPv4 CIDR."
  }
}

variable "private_subnet_cidrs" {
  description = "IPv4 CIDR blocks assigned to private subnets."
  type        = list(string)

  validation {
    condition = alltrue([
      for cidr in var.private_subnet_cidrs : can(cidrnetmask(cidr))
    ])
    error_message = "Every private subnet CIDR must be a valid IPv4 CIDR."
  }
}

variable "tags" {
  description = "Common tags applied to all resources created by this module."
  type        = map(string)
  default     = {}
}