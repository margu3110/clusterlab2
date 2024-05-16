# IAM role for eks
resource "aws_iam_role" "eksClusterRole" {
  name      = var.role_name
  tags      = {
    Project = var.project_tag
  }

  assume_role_policy  = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::126327985977:role/${var.ec2_cross_role_name}"
            },
            "Action": "sts:AssumeRole",
            "Condition": {}
        }
    ]
}
POLICY
}

# eks policy attachment
resource "aws_iam_role_policy_attachment" "clusterLab2-AmazonEKSClusterPolicy" {
  role        = aws_iam_role.eksClusterRole.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# S3 policy attachment
resource "aws_iam_role_policy_attachment" "clusterLab2-AmazonS3FullAccess" {
  role        = aws_iam_role.eksClusterRole.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
