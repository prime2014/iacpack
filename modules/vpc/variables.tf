variable "region" {
  description = "The region where the VPC is going to be created"
}


variable "cidr_block" {
  description = "The CIDR block for the vpc"
}


variable "resource_prefix" {
  description = "A prefix that is going to be used before the names of all cloud resources"
}

variable "eks_cluster_name" {
  description = "The cluster name that will be given to our EKS cluster"
}

