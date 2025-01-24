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
  default     = "10.1.0.0/16"
}

variable "public_subnet_cidr" {
  type        = list(object({ cidr = string, az = string }))
  description = "List of public subnet cidr blocks"
  default     = [
    {
      cidr = "10.1.0.0/19"
      az   = "ap-south-1a"
    },
    {
      cidr = "10.1.32.0/19"
      az   = "ap-south-1b"
    },
    {
      cidr = "10.1.64.0/19"
      az   = "ap-south-1c"
    }
  ]
}

variable "private_subnet_cidr" {
  type        = list(object({ cidr = string, az = string }))
  description = "List of private subnet cidr blocks"
  default     = [
    {
      cidr = "10.1.96.0/19"
      az   = "ap-south-1a"
    },
    {
      cidr = "10.1.128.0/19"
      az   = "ap-south-1b"
    },
    {
      cidr = "10.1.160.0/19"
      az   = "ap-south-1c"
    }
  ]
}

variable "node_group_ami" {
  default     = "ami-0264dd00f30e16fe8"
  type        = string
  description = "AMI type for the EKS node group"
}

variable "node_group_instance_type" {
  default     = "c4.large"
  type        = string
  description = "Instance type for the EKS node group"
}

variable "eks_cluster_permissions" {
  type        = list(object({ principal_arn = string, permission_ploicy_arn = string }))
  description = "List of permissions for the EKS cluster"
  default = [
    {
      principal_arn = "arn:aws:iam::645708657292:user/Admin",
      permission_ploicy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
    },
    {
      principal_arn = "arn:aws:iam::645708657292:user/Manju",
      permission_ploicy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
    },
    {
      principal_arn = "arn:aws:iam::645708657292:user/Akhila",
      permission_ploicy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
    },
    {
      principal_arn = "arn:aws:iam::645708657292:user/Naresh",
      permission_ploicy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
    }
  ]
}
