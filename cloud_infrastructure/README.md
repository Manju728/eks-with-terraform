# cloud_infrastructure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.10.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 5.78.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.78.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.mysql_db_instance](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.rds_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/db_subnet_group) | resource |
| [aws_eip.nat_gateway_eip](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/eip) | resource |
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.eks_node_group](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_node_role](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_cluster_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cni_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_container_registry_ro_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_node_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_ssm_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_vpc_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/internet_gateway) | resource |
| [aws_launch_template.eks_ng_lt](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/launch_template) | resource |
| [aws_nat_gateway.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/nat_gateway) | resource |
| [aws_route.private_route](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/route) | resource |
| [aws_route.public_route](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/route) | resource |
| [aws_route_table.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/route_table) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/route_table_association) | resource |
| [aws_s3_bucket.ecom_s3](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.s3_data_encryption](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_security_group.eks_cluster_sg](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/security_group) | resource |
| [aws_security_group.rds_sg](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/security_group) | resource |
| [aws_subnet.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/vpc) | resource |
| [aws_vpc_security_group_ingress_rule.eks_sg_ingress_rule](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/data-sources/caller_identity) | data source |
| [aws_kms_alias.rds_kms_key](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/data-sources/kms_alias) | data source |
| [aws_kms_alias.s3_kms_key](https://registry.terraform.io/providers/hashicorp/aws/5.78.0/docs/data-sources/kms_alias) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Name of the AWS region | `string` | `"eu-central-1"` | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | RDS mysql database password | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment | `string` | `""` | no |
| <a name="input_node_group_ami"></a> [node\_group\_ami](#input\_node\_group\_ami) | AMI type for the EKS node group | `string` | `"ami-09d1e571bca42994a"` | no |
| <a name="input_node_group_instance_type"></a> [node\_group\_instance\_type](#input\_node\_group\_instance\_type) | Instance type for the EKS node group | `string` | `"m5.large"` | no |
| <a name="input_private_subnet_cidr"></a> [private\_subnet\_cidr](#input\_private\_subnet\_cidr) | List of private subnet cidr blocks | `list(object({ cidr = string, az = string }))` | n/a | yes |
| <a name="input_public_subnet_cidr"></a> [public\_subnet\_cidr](#input\_public\_subnet\_cidr) | List of public subnet cidr blocks | `list(object({ cidr = string, az = string }))` | n/a | yes |
| <a name="input_rds_db_name"></a> [rds\_db\_name](#input\_rds\_db\_name) | RDS mysql database name | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block of the VPC | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
