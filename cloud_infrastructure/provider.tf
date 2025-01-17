terraform {
  backend "s3" {}
  required_version = "= 1.10.3"
  required_providers {
    null = {
      source = "hashicorp/null"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "= 5.80.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      "created-and-managed-by" = "terraform"
    }
  }
}
