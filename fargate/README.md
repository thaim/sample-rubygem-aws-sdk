sample aws-sdk: fargate
==============================
fargateの操作コードサンプル


## 利用方法

## セットアップ
### 関連リソースの構築
FargateクラスタやIAMなど依存するリソースをTerraformで構築する．
詳細は[infra](infra/README.md)を参照．

### Dockerイメージのpush
ECRにサンプルアプリのDockerイメージをpushする．
詳細は[docker-batch-task](docker-batch-task/README.md)を参照．

### タスク定義の登録
taskdefを登録する

### タスクの実行
