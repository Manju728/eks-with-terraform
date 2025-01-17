resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.eks_cluster_name}-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attachment" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_vpc_policy_attachment" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-cluster"
  version  = "1.30"
  role_arn = aws_iam_role.eks_cluster_role.arn

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  vpc_config {
    subnet_ids              = concat(local.public_subnets_ids, local.private_subnet_ids)
    security_group_ids      = [aws_security_group.eks_cluster_sg.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy_attachment,
    aws_iam_role_policy_attachment.eks_vpc_policy_attachment
  ]
  tags = {
    Name                                          = "eks-cluster"
    "alpha.eksctl.io/cluster-name"                = "eks-cluster"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "eks-cluster"
  }
}

resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks-cluster-security-group"
  vpc_id      = aws_vpc.vpc.id
  description = "EKS Cluster Security Group"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name                                          = "eks-cluster-security-group"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "eks-cluster"
  }
}

resource "aws_vpc_security_group_ingress_rule" "eks_sg_ingress_rule" {
  security_group_id            = aws_security_group.eks_cluster_sg.id
  description                  = "Allow traffic within the security group"
  referenced_security_group_id = aws_security_group.eks_cluster_sg.id
  from_port                    = -1
  ip_protocol                  = "-1"
  to_port                      = -1
}
