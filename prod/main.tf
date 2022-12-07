provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "oyakivchik-terraform"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "prod-oyakivchik-terraform-lock"
  }
}