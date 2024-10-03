# Configure ArgoCD Login

### Setup Environment Variables

```bash
NAMESPACE=argocd \
OIDC_SECRET=<secret>
```
### Create Sealed Secret

```bash
kubectl create secret generic argocd-secret \
  --from-literal=oidc.keycloak.clientSecret=${OIDC_SECRET} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/controllers/argocd/argocd-credentials.yaml