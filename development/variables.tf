variable "region" {
  description = "The region where EKS need to be created"
}

variable "resource_prefix" {
  description = "The prefix that will be used to label all resource names"
}


variable "cidr_block" {
  description = "The CIDR block for the vpc"
}

variable "eks_cluster_name" {
  description = "The cluster name that will be provided to the EKS cluster"
}


variable "private_subnet_ids" {
  type        = list(string)
  description = "A list of private subnet ids"
}