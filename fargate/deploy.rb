# aws-sdkの動作テスト用スクリプト
require 'aws-sdk-ecs'
require 'json'

credentials = JSON.load(File.read('../secrets.json'))
Aws.config[:credentials] = Aws::Credentials.new(
  credentials['aws_access_key_id'],
  credentials['aws_secret_access_key']
)
Aws.config.update({
  region: 'ap-northeast-1'
})

ecscli = Aws::ECS::Client.new

resp = ecscli.run_task({
  cluster: "terraform-test",
  task_definition: "sample-fargate",
  launch_type: "FARGATE",
  network_configuration: {
    awsvpc_configuration: {
      subnets: ["subnet-cf3b0a94"],
      security_groups: ["sg-b35a27c0"],
      assign_public_ip: "ENABLED"
    }
  }
})

p resp
