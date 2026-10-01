# ==========================================
# RDS Subnet Group
# ==========================================

resource "aws_db_subnet_group" "mysql" {
  name = "${var.project_name}-db-subnet-group"

  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name        = "${var.project_name}-db-subnet-group"
    Environment = var.environment
  }
}

# ==========================================
# RDS Security Group
# ==========================================

resource "aws_security_group" "rds" {
  name        = "${var.project_name}-rds-sg"
  description = "Allow MySQL traffic from private subnets"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "MySQL from private subnets"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"

    cidr_blocks = aws_subnet.private[*].cidr_block
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-rds-sg"
    Environment = var.environment
  }
}

# ==========================================
# RDS MySQL
# ==========================================

resource "aws_db_instance" "mysql" {
  identifier = "${var.project_name}-mysql"

  engine         = "mysql"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  port = 3306

  db_subnet_group_name = aws_db_subnet_group.mysql.name

  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]

  publicly_accessible = false

  multi_az = false

  backup_retention_period = 1

  deletion_protection = false
  skip_final_snapshot = true

  tags = {
    Name        = "${var.project_name}-mysql"
    Environment = var.environment
  }
}
