module "iam_eks_role" {
  //source = "terraform-aws-modules/iam/aws//modules/iam-eks-role"
  source = "./role"
  role_name = var.role_name
  project_tag = var.project_tag
}


