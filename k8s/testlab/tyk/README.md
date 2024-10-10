# Configure Tyk

### Setup Environment Variables

```bash
NAMESPACE=tyk
API_SECRET=changeit
ADMIN_KEY=changeit
TYK_LICENSE=changeit
ADMIN_EMAIL=<email>
ADMIN_PASSWORD=<password>
REDIS_SECRET=$(openssl rand -hex 16)
```

### Create Sealed Secrets

```bash
$ kubectl create secret generic tyk-api-credentials \
    --from-literal=APISecret=${API_SECRET} \
    --from-literal=AdminSecret=${ADMIN_KEY} \
    --from-literal=DashLicense=${TYK_LICENSE} \
    -n ${NAMESPACE} --dry-run=client -o yaml | \
    kubeseal --controller-namespace=sealed-secrets \
    --format=yaml - > ../k8s/infra/controllers/api-gateway/tyk-api-credentials.yaml
```

```bash
$ kubectl create secret generic tyk-credentials \
    --from-literal=adminUserFirstName=Admin \
    --from-literal=adminUserLastName=User \
    --from-literal=adminUserEmail=${ADMIN_EMAIL} \
    --from-literal=adminUserPassword=${ADMIN_PASSWORD} \
    -n ${NAMESPACE} --dry-run=client -o yaml | \
    kubeseal --controller-namespace=sealed-secrets \
    --format=yaml - > ../k8s/infra/controllers/api-gateway/tyk-credentials.yaml
```

```bash
$ echo ${REDIS_SECRET}
$ kubectl create secret generic redis-credentials \
    --from-literal=password=${REDIS_SECRET} \
    -n ${NAMESPACE} --dry-run=client -o yaml | \
    kubeseal --controller-namespace=sealed-secrets \
    --format=yaml - > ../k8s/infra/controllers/api-gateway/redis-credentials.yaml
```

### Create Database Connection Info

With Postgre database initialized invoke the following script

```bash
$ kubectl get secrets $PG_CLUSTER_NAME-app -n $APP_NS -o json | jq '.data | map_values(@base64d)' | jq -r 'to_entries | .[] | .key + "=" + (.value | @sh)'

$ POSTGRESQLURL=host=$host\ port=$port\ user=$username\ password=$password\ database=$dbname\ sslmode=disable

$ kubectl create secret generic postgres-connection-info \
    --from-literal=postgresUrl=${POSTGRESQLURL} \
    -n ${NAMESPACE} --dry-run=client -o yaml | \
    kubeseal --controller-namespace=sealed-secrets \
    --format=yaml - > ../k8s/infra/controllers/api-gateway/postgres-connection-info.yaml
```