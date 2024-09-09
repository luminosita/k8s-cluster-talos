CERT_FOLDER:=./kubernetes/bootstrap/sealed-secrets/certificate

include common.mk

#TERRAFORM

talos:
	$(info TERRAFORM: Creating Talos Cluster)
	mkdir -p ${CERT_FOLDER} && \
	openssl req -x509 -days 365 -nodes -newkey rsa:4096 -keyout ${CERT_FOLDER}/sealed-secrets.key -out ${CERT_FOLDER}/sealed-secrets.cert -subj "/CN=sealed-secret/O=sealed-secret" && \
	cd kubernetes && \
	terraform init && \ 
	terraform plan && \
	terraform apply && \
	terraform output -raw kube_config > ~/.kube/config

destroy-talos:
	$(info TERRAFORM: Destroying Talos Cluster)
	cd kubernetes && \
	terraform init && \
	terraform destroy 
	# terraform apply && \

gateway:
	$(info TERRAFORM: Cilium Gateway, Cert-manager, ArgoCD)
	kubectl apply -k ../k8s/infra/crds && \
	kubectl kustomize --enable-helm ../k8s/infra/network/cilium | kubectl apply -f - && \
	kustomize build --enable-helm ../k8s/infra/controllers/argocd | kubectl apply -f - && \
	kubectl -n argocd get secret argocd-initial-admin-secret -ojson | jq -r ' .data.password | @base64d' && \
	kubectl apply -k ../k8s/infra && \
	kubectl apply -k ../k8s/sets
