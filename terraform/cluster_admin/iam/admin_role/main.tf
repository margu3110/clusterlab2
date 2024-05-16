# Create an IAM policy
resource "aws_iam_policy" "ec2_iam_policy" {
  name      = var.iam_policy_name
  provider  = aws.clusteradmin

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue",
          "ssm:GetParameter",
          "ssm:GetParameters",
          "ssm:GetParametersByPath",
          "sts:AssumeRole"
        ]
        Resource = [
          "arn:aws:iam::471112762020:role/${var.eks_cross_role_name}"
      ]
      }
    ]
  })
}

# Create the IAM role
resource "aws_iam_role" "ec2_role" {
  name      = var.role_name
  provider  = aws.clusteradmin

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "ec2_role_policy_attachment" {
  provider  = aws.clusteradmin
  name        = "Policy Attachement"
  policy_arn  = aws_iam_policy.ec2_iam_policy.arn
  roles       = [aws_iam_role.ec2_role.name]
}

# Create an IAM instance profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  provider  = aws.clusteradmin
  name      = var.instance_profile_name
  role      = aws_iam_role.ec2_role.name
}