variable "project_name" {
  description = "Project name used for EKS resource names"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs where EKS resources will be deployed"
  type        = list(string)
}
