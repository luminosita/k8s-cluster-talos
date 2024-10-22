# Configure Nexus

### Setup Environment Variables

```bash
NAMESPACE=nexus \
NEXUS_INITIAL_PASSWORD=<admin password>
```
### Create Sealed Secret

```bash
kubectl create secret generic sonatype-credentials \
  --from-literal=password=${NEXUS_INITIAL_PASSWORD} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/repository/nexus/sonatype-credentials.yaml
```
