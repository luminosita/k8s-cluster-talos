# Configure Authelia

### Setup Environment Variables

```bash
NAMESPACE=authelia \
AUTHELIA_PASSWORD=<password>
```
### Create Sealed Secret

```bash
kubectl create secret generic openldap-authelia \
  --from-literal=password=${AUTHELIA_PASSWORD} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/auth/authelia/openldap-authelia.yaml
```
