variable "repository_names" {
  description = "Names of the Amazon ECR repositories created by this module."
  type        = list(string)

  validation {
    condition = (
      length(var.repository_names) > 0 &&
      length(var.repository_names) == length(distinct(var.repository_names))
    )
    error_message = "Provide at least one repository name, and every repository name must be unique."
  }

  validation {
    condition = alltrue([
      for name in var.repository_names :
      can(regex("^[a-z0-9]+(?:[._/-][a-z0-9]+)*$", name))
    ])
    error_message = "Repository names must use lowercase letters, numbers, and valid separators such as hyphens, underscores, periods, or forward slashes."
  }
}

variable "tags" {
  description = "Common tags applied to every ECR repository created by this module."
  type        = map(string)
  default     = {}
}