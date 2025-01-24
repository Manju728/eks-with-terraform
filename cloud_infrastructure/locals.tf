locals {
  private_subnet_ids = [for subnet in aws_subnet.private_subnets : subnet.id]
  public_subnets_ids = [for subnet in aws_subnet.public_subnets : subnet.id]
  user_arns          = [ for user in data.aws_iam_users.users.arns: user if user != data.aws_caller_identity.current.arn]
}
