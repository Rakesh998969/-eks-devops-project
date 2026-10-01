variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "eks-devops-project"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "db_name" {
  description = "MySQL database name"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "MySQL database username"
  type        = string
  default     = "appadmin"
}

variable "db_password" {
  description = "MySQL database password"
  type        = string
  sensitive   = true
}
