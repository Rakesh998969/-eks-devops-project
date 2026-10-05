module "secrets" {
  source = "./modules/secrets"

  project_name = var.project_name
  environment  = var.environment

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

  rds_endpoint = module.rds.endpoint
}
