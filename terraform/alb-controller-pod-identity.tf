# ==========================================
# AWS Load Balancer Controller
# EKS Pod Identity Association
# ==========================================

resource "aws_eks_pod_identity_association" "aws_load_balancer_controller" {
  cluster_name    = aws_eks_cluster.main.name
  namespace       = "kube-system"
  service_account = "aws-load-balancer-controller"

  role_arn = aws_iam_role.aws_load_balancer_controller.arn

  depends_on = [
    aws_eks_addon.pod_identity_agent,
    aws_iam_role_policy_attachment.aws_load_balancer_controller
  ]
}
