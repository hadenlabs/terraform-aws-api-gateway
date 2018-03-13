## Terragrunt
.PHONY: terragrunt.help
TERRAFORM_VERSION := 0.10.0
TERRAFORM_DIR:=$(PROVISION_DIR)/terraform
terragrunt := terragrunt

terragrunt.help:
	@echo '    terragrunt:'
	@echo ''
	@echo '        terragrunt                 Apply all'
	@echo '        terragrunt.init            Init download dependences terraform'
	@echo '        terragrunt.encrypt         encrypt by env'
	@echo '        terragrunt.decrypt         decrypt by env'
	@echo '        terragrunt.plan            plan by env'
	@echo '        terragrunt.apply           apply by env'
	@echo '        terragrunt.output          output by env'
	@echo '        terragrunt.refresh         refresh by env'
	@echo '        terragrunt.destroy         destroy by env'
	@echo ''

terragrunt: clean
	make terragrunt.help

terragrunt.encrypt: clean
	@ansible-vault encrypt "${TERRAFORM_DIR}/us-east-1/${env}/variables.tf" \
		--vault-password-file "${HOME}/${PROJECT}-${env}.txt" && echo $(MESSAGE_HAPPY)

terragrunt.decrypt: clean
	@ansible-vault decrypt "${TERRAFORM_DIR}/us-east-1/${env}/variables.tf" \
		--vault-password-file "${HOME}/${PROJECT}-${env}.txt" && echo $(MESSAGE_HAPPY)

terragrunt.init: clean
	@if [ -z "${env}" ]; then \
		cd "${TERRAFORM_DIR}/us-east-1/" && $(terragrunt) init --reconfigure; \
	else \
		cd "${TERRAFORM_DIR}/us-east-1/${env}/" && $(terragrunt) init --reconfigure; \
	fi

terragrunt.plan: clean
	@if [ -z "${env}" ]; then \
		cd "${TERRAFORM_DIR}/us-east-1/" && $(terragrunt) plan-all --terragrunt-source-update; \
	else \
		cd "${TERRAFORM_DIR}/us-east-1/${env}/" && $(terragrunt) plan --terragrunt-source-update; \
	fi

terragrunt.apply: clean
	@if [ -z "${env}" ]; then \
		cd "${TERRAFORM_DIR}/us-east-1/" && $(terragrunt) apply-all --terragrunt-source-update; \
	else \
		cd "${TERRAFORM_DIR}/us-east-1/${env}/" && $(terragrunt) apply --terragrunt-source-update; \
	fi

terragrunt.destroy: clean
	@if [ -z "${env}" ]; then \
		cd "${TERRAFORM_DIR}/us-east-1/" && $(terragrunt) destroy-all --terragrunt-source-update; \
	else \
		cd "${TERRAFORM_DIR}/us-east-1/${env}/" && $(terragrunt) destroy --terragrunt-source-update; \
	fi

terragrunt.output: clean
	@if [ -z "${env}" ]; then \
		cd "${TERRAFORM_DIR}/us-east-1/" && $(terragrunt) output-all --terragrunt-source-update; \
	else \
		cd "${TERRAFORM_DIR}/us-east-1/${env}/" && $(terragrunt) output --terragrunt-source-update; \
	fi

terragrunt.refresh: clean
	@cd "${TERRAFORM_DIR}/us-east-1/${env}/" && $(terragrunt) refresh
