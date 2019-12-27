resource "aws_ecs_cluster" "terraform_test" {
  name = "terraform-test"
}

resource "aws_iam_role" "task_execution" {
  name               = "FargateTaskExecutionRole"
  assume_role_policy = <<EOF
{
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
