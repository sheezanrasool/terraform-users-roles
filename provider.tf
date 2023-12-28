terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
  alias = "account_a"
}

provider "aws" {
  region  = "us-east-1"
  profile = "poc-2"
  alias = "account_b"
}