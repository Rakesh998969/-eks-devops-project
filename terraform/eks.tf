# ==========================================
# EKS Module
# ==========================================

module "eks" {
  source = "./modules/eks"

  project_name       = var.project_name
  environment        = var.environment
  private_subnet_ids = module.vpc.private_subnet_ids
}
