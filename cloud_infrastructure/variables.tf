data "aws_caller_identity" "current" {}

variable "aws_region" {
  default     = "ap-south-1"
  type        = string
  description = "Name of the AWS region"
}

variable "eks_cluster_name" {
  default     = "eks-cluster"
  type        = string
  description = "Name of the EKS cluster"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block of the VPC"
}

variable "public_subnet_cidr" {
  type        = list(object({ cidr = string, az = string }))
  description = "List of public subnet cidr blocks"
}

variable "private_subnet_cidr" {
  type        = list(object({ cidr = string, az = string }))
  description = "List of private subnet cidr blocks"
}

variable "node_group_ami" {
  default     = "ami-09d1e571bca42994a"
  type        = string
  description = "AMI type for the EKS node group"
}

variable "node_group_instance_type" {
  default     = "c4.large"
  type        = string
  description = "Instance type for the EKS node group"
}
