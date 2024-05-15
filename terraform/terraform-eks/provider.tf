terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "terraform-aragorn"
  default_tags {
    tags = {
      Environment     = "lab"
      Service         = "jenkins"
    }
  }
}