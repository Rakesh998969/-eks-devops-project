# ==========================================
# AWS Load Balancer Controller IAM Policy
# ==========================================

resource "aws_iam_policy" "aws_load_balancer_controller" {
  name = "${var.project_name}-alb-controller-policy"

  description = "IAM policy for AWS Load Balancer Controller"

  policy = file("${path.module}/alb-controller-iam-policy.json")

  tags = {
    Name        = "${var.project_name}-alb-controller-policy"
    Environment = var.environment
  }
}

# ==========================================
# Attach Policy to ALB Controller Role
# ==========================================

resource "aws_iam_role_policy_attachment" "aws_load_balancer_controller" {
  role       = aws_iam_role.aws_load_balancer_controller.name
  policy_arn = aws_iam_policy.aws_load_balancer_controller.arn
}
