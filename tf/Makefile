TF_PLAN:=./homelab.tfplan
TF_WORKSPACE:="homelab"

CERT_FOLDER:=${FOLDER}/"bootstrap/sealed-secrets/certificate"

include common.mk

#TERRAFORM

init-tf: delete-tf
	$(info TERRAFORM: Init Terraform plugins for $(TF_WORKSPACE))

	cd ${FOLDER} && \
	terraform init && \
	terraform workspace new $(TF_WORKSPACE);\

	mkdir -p ${CERT_FOLDER} && \
	openssl req -x509 -days 365 -nodes -newkey rsa:4096 -keyout ${CERT_FOLDER}/sealed-secrets.key -out ${CERT_FOLDER}/sealed-secrets.cert -subj "/CN=sealed-secret/O=sealed-secret"

delete-tf:
	$(info TERRAFORM: Delete Terraform folder)
	
	cd ${FOLDER} && \
	rm -rf .terraform .terraform.lock.hcl terraform.tfstate.d

plan: 
	$(info TERRAFORM: Plan for $(TF_WORKSPACE))
	
	cd ${FOLDER} && \
	terraform workspace select $(TF_WORKSPACE) && \
    terraform plan -out=${TF_PLAN};

apply:
	$(info TERRAFORM: Apply for $(TF_WORKSPACE))

	cd ${FOLDER} && \
	terraform workspace select $(TF_WORKSPACE) && \
    terraform apply ${TF_PLAN};

plan-destroy:
	$(info TERRAFORM: Apply for $(TF_WORKSPACE))

	cd ${FOLDER} && \
	terraform workspace select $(TF_WORKSPACE) && \
    terraform plan -destroy -out=${TF_PLAN}
