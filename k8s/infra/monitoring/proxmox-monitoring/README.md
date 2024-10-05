# Configure OAuth2-proxy 

### Setup Environment Variables

```bash
NAMESPACE=monitoring \
PVE_USER="prometheus@pve"
PVE_TOKEN_NAME="prometheus"
PVE_TOKEN_VALUE=<secret>
```
### Create Sealed Secret

```bash
kubectl create secret generic pve-credentials \
  --from-literal=PVE_USER=${PVE_USER} \
  --from-literal=PVE_TOKEN_NAME=${PVE_TOKEN_NAME} \
  --from-literal=PVE_TOKEN_VALUE=${PVE_TOKEN_VALUE} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/monitoring/proxmox-monitoring/pve-credentials.yaml
```