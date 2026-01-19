terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket         = "prime_iac_bucket"
    key            = "iac/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}


resource "aws_s3_bucket" "s3" {
  bucket = "prime_iac_bucket"
  region = "us-east-1"


  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "prime_iac_bucket"
  }
}