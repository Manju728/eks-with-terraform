data "aws_iam_policy_document" "s3-access" {
  statement {
    sid     = "EKSClusterTOAWSAccess"
    effect  = "Allow"
    actions = [
      "s3:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "s3-access" {
  name   = "eks-access-to-aws-resources-policy"
  role   = aws_iam_role.eks_node_role.id
  policy = data.aws_iam_policy_document.s3-access.json
}
