# ==========================================
# VPC Output
# ==========================================

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}


# ==========================================
# Public Subnets
# ==========================================

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}


# ==========================================
# Private Subnets
# ==========================================

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}


# ==========================================
# ECR
# ==========================================

output "frontend_ecr_repository_url" {
  description = "Frontend ECR repository URL"
  value       = module.ecr.frontend_repository_url
}

output "backend_ecr_repository_url" {
  description = "Backend ECR repository URL"
  value       = module.ecr.backend_repository_url
}
# ==========================================
# EKS Cluster
# ==========================================

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}


output "eks_cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value       = module.eks.cluster_endpoint
}


# ==========================================
# EKS Node Group
# ==========================================

output "eks_node_group_name" {
  description = "EKS managed node group name"
  value       = module.eks.node_group_name
}

# ==========================================
# RDS
# ==========================================

output "rds_endpoint" {
  description = "RDS MySQL endpoint"
  value       = module.rds.endpoint
}

output "rds_port" {
  description = "RDS MySQL port"
  value       = module.rds.port
}

output "github_actions_role_arn" {
  description = "IAM role ARN used by GitHub Actions through OIDC"
  value       = aws_iam_role.github_actions.arn
}

output "rds_credentials_secret_arn" {
  description = "AWS Secrets Manager ARN containing RDS credentials"
  value       = module.secrets.secret_arn
}
