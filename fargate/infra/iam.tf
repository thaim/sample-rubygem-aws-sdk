# ECSタスク実行IAMロール

module "execute_ecs_task_role" {
  source = "../../terraform-modules/iam"
  name = "execute_ecs_task"
  identifier = "ecs-tasks.amazonaws.com"
  policy = data.aws_iam_policy.ecs_task_execution_role_policy.policy
}

data "aws_iam_policy" "ecs_task_execution_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
