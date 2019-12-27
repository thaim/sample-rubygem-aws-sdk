# aws-sdkの動作テスト用スクリプト
require 'aws-sdk'
require 'json'

credentials = JSON.load(File.read('../secrets.json'))
Aws.config[:credentials] = Aws::Credentials.new(
  credentials['aws_access_key_id'],
  credentials['aws_secret_access_key']
)
Aws.config.update({
  region: 'ap-northeast-1'
})

s3cli = Aws::S3::Client.new

resp = s3cli.list_buckets
p resp.buckets.map(&:name)
