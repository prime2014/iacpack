provider "aws" {
  region = var.region

}



resource "aws_eks_cluster" "eks" {
  name     = "${var.resource_prefix}-eks-cluster"
  version  = "1.5.0"
  role_arn = aws_iam_role.eks.arn
  enabled_cluster_log_types = [
    "api",
    "audit"
  ]


  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true
    subnet_ids = var.private_subnet_ids
  }

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

  depends_on = [aws_iam_role_policy_attachment.eks_cluster_AmamzonEKSClusterPolicy]
}