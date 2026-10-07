# ==========================================
# AWS Load Balancer Controller IAM Role
# ==========================================

resource "aws_iam_role" "aws_load_balancer_controller" {
  name = "${var.project_name}-alb-controller-role"

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
    Name        = "${var.project_name}-alb-controller-role"
    Environment = var.environment
  }
}
