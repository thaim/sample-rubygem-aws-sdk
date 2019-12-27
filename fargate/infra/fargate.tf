resource "aws_ecs_cluster" "terraform_test" {
  name = "terraform-test"
}

resource "aws_iam_role" "task_execution" {
  name               = "FargateTaskExecutionRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowFargateToPullAndDeployDockerImage",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = {
    generator = "terraform"
    env       = "eval"
  }
}

resource "aws_iam_role_policy" "task_execution" {
  name   = "FargateTaskExecutionRolePolicy"
  role   = aws_iam_role.task_execution.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
