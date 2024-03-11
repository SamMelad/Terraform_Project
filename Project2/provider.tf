terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.0"
    }
  }
}


terraform {
  backend "s3" {
  bucket = "backendtf-bucket-sam2"
  key    = "project2-state"
  region = "us-east-2"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
  access_key = ""
  secret_key = ""
}
