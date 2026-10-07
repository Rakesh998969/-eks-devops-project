# ==========================================
# External Secrets IAM Role
# ==========================================

resource "aws_iam_role" "external_secrets" {
  name = "${var.project_name}-external-secrets-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "pods.eks.amazonaws.com"
        }

        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
      }
    ]
  })

  tags = {
    Name        = "${var.project_name}-external-secrets-role"
    Environment = var.environment
  }
}


# ==========================================
# Policy - Read RDS Secret
# ==========================================

resource "aws_iam_policy" "external_secrets" {
  name = "${var.project_name}-external-secrets-policy"

  description = "Allow External Secrets Operator to read the RDS credentials secret"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]

        Resource = module.secrets.secret_arn
      }
    ]
  })

  tags = {
    Name        = "${var.project_name}-external-secrets-policy"
    Environment = var.environment
  }
}


# ==========================================
# Attach Policy to Role
# ==========================================

resource "aws_iam_role_policy_attachment" "external_secrets" {
  role       = aws_iam_role.external_secrets.name
  policy_arn = aws_iam_policy.external_secrets.arn
}
