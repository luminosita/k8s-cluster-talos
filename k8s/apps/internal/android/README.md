# Configure VSCode

### Setup Environment Variables

```bash
NAMESPACE=android \
VSCODE_PASSWORD=<vscode password>
VSCODE_OIDC_SECRET=<secret>
```
### Create Sealed Secret

```bash
kubectl create secret generic vscode-credentials \
  --from-literal=password=${VSCODE_PASSWORD} \
  --from-literal=oidc.secret=${VSCODE_OIDC_SECRET} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/apps/internal/android/vscode-credentials.yaml
```
