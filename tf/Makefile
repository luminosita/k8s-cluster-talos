CERT_FOLDER:=./cluster/bootstrap/sealed-secrets/certificate

include common.mk

talos:
	$(info TERRAFORM: Creating Talos Cluster)
	mkdir -p ${CERT_FOLDER} && \
		openssl req -x509 -days 365 -nodes -newkey rsa:4096 -keyout ${CERT_FOLDER}/sealed-secrets.key -out ${CERT_FOLDER}/sealed-secrets.cert -subj "/CN=sealed-secret/O=sealed-secret"

#Deploy Talos cluster and set local ~/.kube.config	
	cd cluster && \
		terraform init && \
		terraform plan -out talos.tfplan && \
		terraform apply talos.tfplan && \
		terraform output -raw kube_config > ~/.kube/config

destroy-talos:
	$(info TERRAFORM: Destroying Talos Cluster)
	cd cluster && \
		terraform plan -destroy -out=destroy.tfplan && \
		terraform apply destroy.tfplan

k8s:
	$(info TERRAFORM: Cilium Gateway, Cert-manager, ArgoCD)
#Gateway API CRDs for cilium-gateways
	kubectl apply -k ../k8s/infra/crds
#Reload Cilium with L2 announcement policy and ip pools
	kubectl kustomize --enable-helm ../k8s/infra/network/cilium | kubectl apply -f -
#Sealed secrets for cert-manager and gateway certificates
	kustomize build --enable-helm ../k8s/infra/controllers/sealed-secrets | kubectl apply -f -
#Deploy Local Path Provisioner for ArgoCD applications
	kustomize build ../k8s/infra/storage/local-path-provisioner | kubectl apply -f -
#Deploy Proxmox CSI plugin for ArgoCD applications
	kustomize build --enable-helm ../k8s/infra/storage/proxmox-csi | kubectl apply -f -
	kubectl get csistoragecapacities -ocustom-columns=CLASS:.storageClassName,AVAIL:.capacity,ZONE:.nodeTopology.matchLabels -A
#Deploy Cilium gateways for argocd http routes
	kubectl kustomize ../k8s/infra/network/gateway | kubectl apply -f -
#Deploy ArgoCD to load the full set of applicatoins
	kustomize build --enable-helm ../k8s/infra/controllers/argocd | kubectl apply -f -
#Loading of the cluster into ArgoCD
	kubectl apply -k ../k8s/sets

######################### TEST PURPOSE #######################

cert-secret:
	$(info Creating Cloudflare Cert-manager Sealed Secret)
	kubectl create secret generic cloudflare-api-token \
  	  	--from-literal=api-token=${CF_TOKEN} \
	  	-n cert-manager --dry-run=client -o yaml | \
  		kubeseal --controller-namespace=sealed-secrets \
		--format=yaml - > ../k8s/infra/controllers/cert-manager/cloudflare-api-token.yaml

#Deploy testlab project and applications under k8s/testlab for a specific branch
deploy-testlab:
	BRANCH ?= $(shell bash -c 'read -s -p "Password: " pwd; echo $$pwd')
	git checkout $(BRANCH) && \
		kubectl apply -k ../k8s/testlab

test-plan:
	$(info TERRAFORM: Test Plan)
	cd cluster && \
		terraform plan -out temp.tfplan

test-apply:
	$(info TERRAFORM: Test Apply)
	cd cluster && \
		terraform apply temp.tfplan

