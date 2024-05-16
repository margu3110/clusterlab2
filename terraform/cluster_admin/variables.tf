variable "instance_type" {
    type    = string
    default = "t2.micro"
}

variable "appName" {
    type    = string
    default = "deployer"
}

variable "ami" {
    type    = string
    default = "ami-0e1d30f2c40c4c701"
}

variable "key_name" {
    type    = string
    default = "elrond"
}

variable "project_tag" {
    type    = string
    default = "clusterlab2"
}

variable "eks_role_name" {
    type    = string
    default = "ec2ClusterAdminRole"
}

variable "ec2_role_name" {
    type    = string
    default = "devOpsRole"
}

variable "ec2_name" {
    type    = string
    default = "clusterAdmin"
}
