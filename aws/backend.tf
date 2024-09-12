provider "aws" {
  region                  = "ap-northeast-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                 = "ai-ohr486-net-terraform"
}

terraform {
  backend "s3" {
    bucket                  = "ohr486.terraform"
    key                     = "ai-ohr486-net.tfstate"
    region                  = "ap-northeast-1"
    dynamodb_table          = "tfstate"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "ai-ohr486-net-terraform"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}