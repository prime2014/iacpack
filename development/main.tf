

module "vpc" {
  source           = "../modules/vpc"
  resource_prefix  = var.resource_prefix
  region           = var.region
  cidr_block       = var.cidr_block
  eks_cluster_name = var.eks_cluster_name
}

module "eks" {
  source             = "../modules/eks"
  resource_prefix    = var.resource_prefix
  region             = var.region
  private_subnet_ids = module.vpc.private_subnets
}