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
    alias   = "clusteradmin"
    profile = "terraform-elrond"
}

provider "aws" {
    region  = "us-east-1"
    profile = "terraform-aragorn"
}

data "aws_vpc" "default_vpc" {
  provider  = aws.clusteradmin
  default   = true
} 

#Create security group for EC2
### Security Group Module
module "ec2_sg" {
  providers = {
    aws.clusteradmin = aws.clusteradmin
  }

  source    = "./sg"
  appName   = var.appName
  vpc_id    = data.aws_vpc.default_vpc.id
}

# Terraform module Block to create the iam role for clusteradmin
module "iam_instance_profile" {
  providers = {
    aws.clusteradmin = aws.clusteradmin
  }

  source                = "./iam/admin_role"
  instance_profile_name = "instanceProfileDevops"
  iam_policy_name       = "devOpsPolicy"
  role_name             = "devOpsRole"
}

# Terraform module Block to create the iam role for clusteradmin on the eks account
module "iam_eks_role" {
  source      = "./iam/eks_role"
  role_name   = "ec2ClusterAdminRole"
  project_tag = var.project_tag
}

# Terraform module Block to create EC2 (kubectl)
module "ec2" {
  providers = {
    aws.clusteradmin = aws.clusteradmin
  }

  source            = "./ec2"
  ec2_name          = "clusterAdmin"
  key_name          = var.key_name
  ami               = var.ami
  instance_type     = var.instance_type
  vpc_sg            = module.ec2_sg.ec2_sg_id
  instance_profile  = module.iam_instance_profile.instance_profile
}

data "aws_caller_identity" "current" {}
