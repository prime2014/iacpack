variable "region" {
  description = "The region which we we use to create the EKS cluster"
}

variable "resource_prefix" {
  description = "This is a prefix that is going to be assigned to every eks resource"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "A list of private subnet ids"
}

variable "enable_vpc_flow_logs" {
  description = "Enable VPC Flow Logs for this VPC"
  type        = bool
  default     = true
}

variable "vpc_flow_logs_retention_days" {
  description = "Number of days to keep VPC Flow Logs in CloudWatch"
  type        = number
  default     = 30
}