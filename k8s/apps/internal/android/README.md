# Configure VSCode

### Setup Environment Variables

```bash
NAMESPACE=android \
VSCODE_PASSWORD=<vscode password>
```
### Create Sealed Secret

```bash
kubectl create secret generic vscode-credentials \
  --from-literal=password=${VSCODE_PASSWORD} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/apps/internal/android/vscode-credentials.yaml
```
