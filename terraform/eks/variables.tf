variable "role_name" {
    type    = string
    default = "clusterlab2-eks-cluster-role"
}

variable "environment" {
    type    = string
    default = "dev"
}

variable "project_tag" {
    type    = string
    default = "clusterlab2"
}

variable "region" {
    type    = string
    default = "us-east-1"
}

#Module      : VPC
#Description : Terraform VPC module variables.
variable "vpc_name" {
    type    = string
    default = "test-cluster"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "List of Availability Zones (e.g. `['us-east-1a', 'us-east-1b', 'us-east-1c']`)."
}

variable "vpc_private_subnets" {
  type        = list(string)
  default     = ["192.168.160.0/19", "192.168.128.0/19", "192.168.96.0/19"]
  description = "Private subnets."
}

variable "vpc_public_subnets" {
  type        = list(string)
  default     = ["192.168.64.0/19", "192.168.32.0/19", "192.168.0.0/19"]
  description = "Public subnets."
}

variable "vpc_cidr_block" {
  type        = string
  default     = "192.168.0.0/16"
  description = "Base CIDR block which is divided into subnet CIDR blocks (e.g. `10.0.0.0/16`)."
}

#Module      : eks
#Description : Terraform eks module variables.

variable "cluster_name" {
    type    = string
    default = "lab2-eks-cluster-role"
}

variable "cluster_version" {
  description = "EKS cluster version."
  type        = string
  default     = "1.29"
}

variable "ami_release_version" {
  description = "Default EKS AMI release version for node groups"
  type        = string
  default     = "1.29.0-20240129"
}