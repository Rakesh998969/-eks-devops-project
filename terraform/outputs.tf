# ==========================================
# VPC Output
# ==========================================

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}


# ==========================================
# Public Subnets
# ==========================================

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}


# ==========================================
# Private Subnets
# ==========================================

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = aws_subnet.private[*].id
}


# ==========================================
# ECR
# ==========================================

output "frontend_ecr_repository_url" {
  description = "Frontend ECR repository URL"
  value       = aws_ecr_repository.frontend.repository_url
}

output "backend_ecr_repository_url" {
  description = "Backend ECR repository URL"
  value       = aws_ecr_repository.backend.repository_url
}


# ==========================================
# EKS Cluster
# ==========================================

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.main.name
}


output "eks_cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value       = aws_eks_cluster.main.endpoint
}


# ==========================================
# EKS Node Group
# ==========================================

output "eks_node_group_name" {
  description = "EKS managed node group name"
  value       = aws_eks_node_group.main.node_group_name
}

# ==========================================
# RDS
# ==========================================

output "rds_endpoint" {
  description = "RDS MySQL endpoint"
  value       = aws_db_instance.mysql.address
}

output "rds_port" {
  description = "RDS MySQL port"
  value       = aws_db_instance.mysql.port
}

output "github_actions_role_arn" {
  description = "IAM role ARN used by GitHub Actions through OIDC"
  value       = aws_iam_role.github_actions.arn
}

output "rds_credentials_secret_arn" {
  description = "AWS Secrets Manager ARN containing RDS credentials"
  value       = aws_secretsmanager_secret.rds_credentials.arn
}
