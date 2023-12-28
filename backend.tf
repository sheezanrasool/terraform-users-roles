terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "groups-roles-project"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}