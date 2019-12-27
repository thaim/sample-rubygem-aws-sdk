
-include ../../.env
ifdef AWS_PROFILE
  PROFILE = --profile ${AWS_PROFILE}
endif


IMAGE="$(AWS_ACCOUNT_ID).dkr.ecr.ap-northeast-1.amazonaws.com/eval-fargate-batch"

.PHONY: help

help: ## Show help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-12s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build docker image
	docker build \
		-t $(IMAGE):latest \
		-t thaim/eval-fargate-batch:latest \
		.

push: login ## Push docker image to ECR
	docker push $(IMAGE):latest

login: ## Login to ECR
	$$(aws ${PROFILE} ecr get-login --no-include-email --region ap-northeast-1)
