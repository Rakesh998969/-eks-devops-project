# ==========================================
# Frontend ECR Lifecycle Policy
# ==========================================

resource "aws_ecr_lifecycle_policy" "frontend" {
  repository = module.ecr.frontend_repository_name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1

        description = "Keep the latest 10 frontend images"

        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 10
        }

        action = {
          type = "expire"
        }
      }
    ]
  })
}


# ==========================================
# Backend ECR Lifecycle Policy
# ==========================================

resource "aws_ecr_lifecycle_policy" "backend" {
  repository = module.ecr.backend_repository_name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1

        description = "Keep the latest 10 backend images"

        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 10
        }

        action = {
          type = "expire"
        }
      }
    ]
  })
}
