locals {
  private_subnet_ids = [for subnet in aws_subnet.private_subnets : subnet.id]
  public_subnets_ids = [for subnet in aws_subnet.public_subnets : subnet.id]
}
