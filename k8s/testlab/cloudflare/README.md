# Configure Cloudflare

### Setup Environment Variables

```bash
NAMESPACE=cloudflare-operator-system  \
CF_API_KEY=<cf global api key>
CF_API_TOKEN=<cf api token>
```
### Create Sealed Secret

```bash
kubectl create secret generic cloudflare-credentials \
  --from-literal=CLOUDFLARE_API_TOKEN=${CF_API_TOKEN} \
  --from-literal=CLOUDFLARE_API_KEY=${CF_API_KEY} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/network/cloudflare/cloudflare-credentials.yaml
```
