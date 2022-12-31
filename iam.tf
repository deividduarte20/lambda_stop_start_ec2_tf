resource "aws_iam_role" "cloudprotegida-ec2-lambda-role-stopstart" {
  name = "${var.project}-role-stopstart"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy" "cloudprotegida-ec2-lambda-policy-stopstart" {
  name = "${var.project}-policy-stopstart"
  role = aws_iam_role.cloudprotegida-ec2-lambda-role-stopstart.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "arn:aws:logs:*:*:*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:DescribeInstances",
          "ec2:StartInstances",
          "ec2:DescribeTags",
          "ec2:DescribeInstanceTypes",
          "ec2:StopInstances",
          "ec2:DescribeInstanceStatus"
        ],
        "Resource" : "*"
      }
    ]
  })
}
