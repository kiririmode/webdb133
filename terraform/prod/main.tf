terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48"
    }
  }
  required_version = "~> 1.3"
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}

module "bucket" {
  source = "../modules/bucket/"

  bucket_name = "kiririmode-webdb-prod"
}
