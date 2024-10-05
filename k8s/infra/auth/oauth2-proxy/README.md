# Configure OAuth2-proxy 

### Setup Environment Variables

```bash
NAMESPACE=oauth2-proxy \
OIDC_CLIENT_ID=<client_id>
OIDC_CLIENT_SECRET=<client_secret>
COOKIE_SECRET=$(openssl rand -hex 16)
```
### Create Sealed Secret

```bash
kubectl create secret generic oidc-credentials \
  --from-literal=oauth2_proxy_client_id=${OIDC_CLIENT_ID} \
  --from-literal=oauth2_proxy_client_secret=${OIDC_CLIENT_SECRET} \
  --from-literal=oauth2_proxy_cookie_secret=${COOKIE_SECRET} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/auth/oauth2-proxy/oidc-credentials.yaml
```