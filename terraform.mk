## Terragrunt
.PHONY: terragrunt.help
TERRAFORM_VERSION := 0.10.0
TERRAFORM_DIR:=$(PROVISION_DIR)/terraform

terraform:
	make terraform.help

terraform.help:
	@echo '    terraform:'
	@echo ''
	@echo '        terraform                 Apply all'
	@echo '        terraform.encrypt         encrypt by env'
	@echo '        terraform.decrypt         decrypt by env'
	@echo '        terraform.plan            plan by env'
	@echo '        terraform.apply           apply by env'
	@echo '        terraform.destroy         destroy by env'
	@echo ''

terraform.encrypt: clean
	@ansible-vault encrypt "${TERRAFORM_DIR}/us-east-1/${env}/variables.tf" \
		--vault-password-file "${HOME}/${PROJECT}.txt" && echo $(MESSAGE_HAPPY)

terraform.decrypt: clean
	@ansible-vault decrypt "${TERRAFORM_DIR}/us-east-1/${env}/variables.tf" \
		--vault-password-file "${HOME}/${PROJECT}.txt" && echo $(MESSAGE_HAPPY)

terraform.plan: clean
	@cd "${TERRAFORM_DIR}/us-east-1/${env}/" && $(terraform) plan

terraform.apply: clean terraform.plan
	@cd "${TERRAFORM_DIR}/us-east-1/${env}/" && $(terraform) apply

terraform.destroy: clean terraform.plan
	@cd "${TERRAFORM_DIR}/us-east-1/${env}/" && $(terraform) destroy
