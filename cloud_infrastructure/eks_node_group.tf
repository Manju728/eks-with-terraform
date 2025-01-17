resource "aws_iam_role" "eks_node_role" {
  name = "eks-node-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_node_policy_attachment" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy_attachment" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "eks_container_registry_ro_policy_attachment" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "eks_ssm_policy_attachment" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_launch_template" "eks_ng_lt" {
  name          = "eks-ng-lt"
  image_id      = var.node_group_ami
  instance_type = var.node_group_instance_type
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 80
      volume_type = "gp3"
      iops        = 3000
      throughput  = 125
    }
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    /etc/eks/bootstrap.sh ${aws_eks_cluster.eks_cluster.name} \
      --container-runtime containerd \
      --kubelet-extra-args '--node-labels=eks.amazonaws.com/nodegroup-image=${var.node_group_ami}'
    EOF
  )

  network_interfaces {
    delete_on_termination = true
    security_groups       = [for vc in aws_eks_cluster.eks_cluster.vpc_config : vc.cluster_security_group_id]
  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name                     = "eks-node"
      "created-and-managed-by" = "terraform"
    }
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      Name                     = "eks-node"
      "created-and-managed-by" = "terraform"
    }
  }
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = local.private_subnet_ids
  # instance_types  = [var.node_group_instance_type]
  # disk_size       = 20
  # ami_type        = "AL2_x86_64"
  launch_template {
    id      = aws_launch_template.eks_ng_lt.id
    version = aws_launch_template.eks_ng_lt.latest_version
  }
  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_node_policy_attachment,
    aws_iam_role_policy_attachment.eks_cni_policy_attachment,
    aws_iam_role_policy_attachment.eks_container_registry_ro_policy_attachment,
    aws_iam_role_policy_attachment.eks_ssm_policy_attachment
  ]

  tags = {
    "alpha.eksctl.io/cluster-name"                = aws_eks_cluster.eks_cluster.name
    "alpha.eksctl.io/nodegroup-name"              = "eks-node-group"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = aws_eks_cluster.eks_cluster.name
    "alpha.eksctl.io/nodegroup-type"              = "managed"
  }

  labels = {
    "alpha.eksctl.io/cluster-name"   = aws_eks_cluster.eks_cluster.name
    "alpha.eksctl.io/nodegroup-name" = "eks-node-group"
  }
}
