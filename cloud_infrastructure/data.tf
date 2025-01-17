data "aws_kms_alias" "rds_kms_key" {
  name = "alias/aws/rds"
}

data "aws_kms_alias" "s3_kms_key" {
  name = "alias/aws/s3"
}
