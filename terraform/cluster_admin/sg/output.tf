output "ec2_sg_id" {
    description = "Id for the ec2 sg"
    value = aws_security_group.ec2-sg.id
}
