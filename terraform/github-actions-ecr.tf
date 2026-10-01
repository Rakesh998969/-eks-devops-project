# ==========================================
# GitHub Actions ECR Policy
# ==========================================

resource "aws_iam_policy" "github_actions_ecr" {
  name        = "${var.project_name}-github-actions-ecr"
  description = "Allow GitHub Actions to push Docker images to project ECR repositories"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "ecr:GetAuthorizationToken"
        ]

        Resource = "*"
      },

      {
        Effect = "Allow"

        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]

        Resource = [
          aws_ecr_repository.frontend.arn,
          aws_ecr_repository.backend.arn
        ]
      }
    ]
  })

  tags = {
    Name        = "${var.project_name}-github-actions-ecr"
    Environment = var.environment
  }
}


# ==========================================
# Attach ECR Policy to GitHub Actions Role
# ==========================================

resource "aws_iam_role_policy_attachment" "github_actions_ecr" {
  role       = aws_iam_role.github_actions.name
  policy_arn = aws_iam_policy.github_actions_ecr.arn
}
