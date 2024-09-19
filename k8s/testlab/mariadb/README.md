# Configure MariaDB

### Setup Environment Variables

```bash
NAMESPACE=mariadb \
DB_ROOT_PASSWORD=<root password> \
DB_PASSWORD=<password>
```
### Create Sealed Secret

```bash
kubectl create secret generic mariadb-credentials \
  --from-literal=root-password=${DB_ROOT_PASSWORD} \
  --from-literal=password=${DB_PASSWORD} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/databases/mariadb/mariadb-credentials.yaml
```