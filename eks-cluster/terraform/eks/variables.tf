variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_group_iam_role" {
  description = "IAM role for EKS node group"
  type        = string
}

variable "node_instance_type" {
  description = "Instance type for EKS nodes"
  default     = "t3.medium"
}
