# k8s-cluster-talos

cd tf

TF_WS=kubernetes make certificates

TF_WS=kubernetes make init-tf
TF_WS=kubernetes make plan
TF_WS=kubernetes make apply

TF_WS=kubernetes make kubeconfig

TF_WS=gateway make init-tf
TF_WS=gateway make plan
TF_WS=gateway make apply
