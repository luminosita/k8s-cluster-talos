CERT_FOLDER:=./kubernetes/bootstrap/sealed-secrets/certificate

include common.mk

talos:
	$(info TERRAFORM: Creating Talos Cluster)
	mkdir -p ${CERT_FOLDER} && \
	openssl req -x509 -days 365 -nodes -newkey rsa:4096 -keyout ${CERT_FOLDER}/sealed-secrets.key -out ${CERT_FOLDER}/sealed-secrets.cert -subj "/CN=sealed-secret/O=sealed-secret" && \
	cd kubernetes && \
	terraform init && \
	terraform plan -out talos.tfplan && \
	terraform apply talos.tfplan && \
	terraform output -raw kube_config > ~/.kube/config

destroy-talos:
	$(info TERRAFORM: Destroying Talos Cluster)
	cd kubernetes && \
	terraform plan -destroy -out=destroy.tfplan
	# terraform apply destroy.tfplan && \

gateway:
	$(info TERRAFORM: Cilium Gateway, Cert-manager, ArgoCD)
	kubectl apply -k ../k8s/infra/crds && \
	kubectl kustomize --enable-helm ../k8s/infra/network/cilium | kubectl apply -f - && \
	kubectl kustomize ../k8s/infra/network/gateway | kubectl apply -f - && \
	kustomize build --enable-helm ../k8s/infra/controllers/argocd | kubectl apply -f - && \
	kubectl apply -k ../k8s/infra && \
	kubectl apply -k ../k8s/sets
