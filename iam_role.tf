resource "aws_iam_role" "role-1" {
  name = "example-role-1"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "example_policy_attachment_ec2-1" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.role-1.name
}

resource "aws_iam_role_policy_attachment" "example_policy_attachment_s3-1" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.role-1.name
}

resource "aws_iam_instance_profile" "instance_profile-1" {
  name = "instance-profile"
  role = aws_iam_role.role-1.name
}
