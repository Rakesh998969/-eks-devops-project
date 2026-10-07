# ==========================================
# VPC
# ==========================================

module "vpc" {
  source = "../../modules/vpc"

  project_name       = var.project_name
  environment        = var.environment
  vpc_cidr           = var.vpc_cidr
  availability_zones = data.aws_availability_zones.available.names
}

# ==========================================
# ECR
# ==========================================

module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  environment  = var.environment
}

# ==========================================
# EKS
# ==========================================

module "eks" {
  source = "../../modules/eks"

  project_name       = var.project_name
  environment        = var.environment
  private_subnet_ids = module.vpc.private_subnet_ids
}

# ==========================================
# RDS
# ==========================================

module "rds" {
  source = "../../modules/rds"

  project_name = var.project_name
  environment  = var.environment

  vpc_id               = module.vpc.vpc_id
  private_subnet_ids   = module.vpc.private_subnet_ids
  private_subnet_cidrs = module.vpc.private_subnet_cidrs

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

# ==========================================
# Secrets Manager
# ==========================================

module "secrets" {
  source = "../../modules/secrets"

  project_name = var.project_name
  environment  = var.environment

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

  rds_endpoint = module.rds.endpoint
}
