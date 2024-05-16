variable "role_name" {
    type    = string
    default = "ec2ClusterAdminRole"
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

