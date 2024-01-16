.PHONY: init
init : 
	terraform init

.PHONY: plan
plan : 
	terraform plan

.PHONY: apply
apply : 
	terraform apply -auto-approve

.PHONY: destroy
destroy : 
	terraform destroy -auto-approve

.PHONY: eks_auth
eks_auth :
	aws eks --region $(terraform output -raw region) update-kubeconfig \
    --name $(terraform output -raw cluster_name)


