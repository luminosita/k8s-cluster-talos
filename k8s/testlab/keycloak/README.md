# Configure Keycloak

### Setup Environment Variables

```bash
NAMESPACE=keycloak \
KEYCLOAK_ADMIN_PASSWORD=<keycloak admin password> \
PSQL_ADMIN_PASSWORD=<db admin password> \
PSQL_USERNAME=<custom db username> \
PSQL_PASSWORD=<custom db password>
```
### Create Keycloak Sealed Secret

```bash
kubectl create secret generic keycloak-admin-password \
  --from-literal=password=${KEYCLOAK_ADMIN_PASSWORD} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/auth/keycloak/keycloak-admin.yaml
```

### Create DB Credentials Sealed Secret

```bash
kubectl create secret generic keycloak-db-credentials \
  --from-literal=postgres-password=${PSQL_ADMIN_PASSWORD} \
  --from-literal=username=${PSQL_USERNAME} \
  --from-literal=password=${PSQL_PASSWORD} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/auth/keycloak/keycloak-db-credentials.yaml
```

### Create Keycloak Crossplane Credentials Sealed Secret

```bash
kubectl create secret generic keycloak-credentials \
  --from-literal=credentials=${KEYCLOAK_ADMIN_PASSWORD} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/crossplane-crds/providers/keycloak/keycloak-credentials.yaml
```
