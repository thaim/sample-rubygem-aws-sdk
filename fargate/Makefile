
-include ../.env
ifdef AWS_PROFILE
  PROFILE = --profile ${AWS_PROFILE}
endif

.PHONY: help register deploy

help: ## Show help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-12s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

generate: ## Generate taskdef file from template
	sed 's/AWS_ACCOUNT_ID/${AWS_ACCOUNT_ID}/g' ecs_taskdef.json.tmpl > ecs_taskdef.json

register: ## Register ECS taskdef
	aws ${PROFILE} ecs register-task-definition --cli-input-json file://ecs_taskdef.json

deploy: ## Deploy fargate task
	aws ${PROFILE} ecs run-task \
		--cluster terraform-test \
		--task-definition sample-fargate \
		--network-configuration $(shell cat network-config.json)
