provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "oyakivchik-terraform"
    key            = "stage/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "stage-oyakivchik-terraform-lock"
  }
}