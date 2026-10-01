# ==========================================
# EKS Cluster
# ==========================================

resource "aws_eks_cluster" "main" {
  name     = "${var.project_name}-cluster"
  role_arn = aws_iam_role.eks_cluster.arn
  version  = "1.32"

  vpc_config {
    subnet_ids = aws_subnet.private[*].id

    endpoint_private_access = true
    endpoint_public_access  = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]

  tags = {
    Name        = "${var.project_name}-cluster"
    Environment = var.environment
  }
}


# ==========================================
# EKS Managed Node Group
# ==========================================

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.project_name}-nodes"
  node_role_arn   = aws_iam_role.eks_node.arn

  subnet_ids = aws_subnet.private[*].id

  instance_types = ["t3.medium"]

  capacity_type = "ON_DEMAND"

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  disk_size = 20

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.ecr_read_only
  ]

  tags = {
    Name        = "${var.project_name}-node"
    Environment = var.environment
  }
}
