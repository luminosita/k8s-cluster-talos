# Configure OAuth2-proxy 

### Setup Environment Variables

```bash
NAMESPACE=oauth2-proxy \
OIDC_SECRET=<secret>
```
### Create Sealed Secret

```bash
kubectl create secret generic oidc-secret \
  --from-literal=oidc.secret=${OIDC_SECRET} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/auth/oauth2-proxy/oidc-secret.yaml
```