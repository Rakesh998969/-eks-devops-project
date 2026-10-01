# ==========================================
# RDS Credentials - AWS Secrets Manager
# ==========================================

resource "aws_secretsmanager_secret" "rds_credentials" {
  name = "${var.project_name}/rds-credentials"

  description = "Credentials for the EKS DevOps project RDS database"

  tags = {
    Name        = "${var.project_name}-rds-credentials"
    Environment = var.environment
  }
}


resource "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id = aws_secretsmanager_secret.rds_credentials.id

  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
    database = var.db_name
    host     = aws_db_instance.mysql.address
    port     = "3306"
  })
}
