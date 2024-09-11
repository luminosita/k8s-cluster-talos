CERT_FOLDER:=./cluster/bootstrap/sealed-secrets/certificate

include common.mk

talos:
	$(info TERRAFORM: Creating Talos Cluster)
	mkdir -p ${CERT_FOLDER} && \
	openssl req -x509 -days 365 -nodes -newkey rsa:4096 -keyout ${CERT_FOLDER}/sealed-secrets.key -out ${CERT_FOLDER}/sealed-secrets.cert -subj "/CN=sealed-secret/O=sealed-secret" && \
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

bootstrap-k8s:
	$(info BOOTSTRAP: Cilium Gateway, Cert-manager)
#Gateway API CRDs for cilium-gateways
	kubectl apply -k ../k8s/infra/crds
#Reload Cilium with L2 announcement policy and ip pools
	kubectl kustomize --enable-helm ../k8s/infra/network/cilium | kubectl apply -f -
#Sealed secrets for cert-manager and gateway certificates
	kustomize build --enable-helm ../k8s/infra/controllers/sealed-secrets | kubectl apply -f -
#Deploy Local Path Provisioner for ArgoCD applications
	kustomize build ../k8s/infra/storage/local-path-provisioner | kubectl apply -f -
	$(info Verify: Local Path Provisioner CSI)
	kubectl -n local-path-storage get pod
#Deploy Proxmox CSI plugin for ArgoCD applications
	kustomize build --enable-helm ../k8s/infra/storage/proxmox-csi | kubectl apply -f -
	$(info Verify: Proxmox CSI)
	kubectl get csistoragecapacities -ocustom-columns=CLASS:.storageClassName,AVAIL:.capacity,ZONE:.nodeTopology.matchLabels -A

argocd:
	$(info ARGOCD Deployment)
#Deploy Cilium gateways for argocd http routes
	kubectl kustomize ../k8s/infra/network/gateway | kubectl apply -f -
#Deploy ArgoCD to load the full set of applicatoins
	kustomize build --enable-helm ../k8s/infra/controllers/argocd | kubectl apply -f -
#Loading of the cluster into ArgoCD
	kubectl apply -k ../k8s/sets
