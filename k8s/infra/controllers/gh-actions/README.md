# Configure GitHub Actions Runner

### Setup Environment Variables

```bash
NAMESPACE=gh-actions \
GITHUB_APP_ID=<app_id>
GITHUB_APP_INSTALLATION_ID=<installation_id>
GITHUB_APP_PRIVATE_KEY_FILE=<private_key>
```
### Create Sealed Secret

```bash
$ kubectl create secret generic controller-manager \
    --from-literal=github_app_id=${GITHUB_APP_ID} \
    --from-literal=github_app_installation_id=${GITHUB_APP_INSTALLATION_ID} \
    --from-file=github_app_private_key=${GITHUB_APP_PRIVATE_KEY_FILE} \
    -n ${NAMESPACE} --dry-run=client -o yaml | \
    kubeseal --controller-namespace=sealed-secrets \
    --format=yaml - > ../k8s/infra/controllers/gh-actions/controller-mananger-credentials.yaml
```

```bash
GITHUB_WEBHOOK_SECRET=$(openssl rand -hex 16)
```

```bash
$ echo ${GITHUB_WEBHOOK_SECRET}
$ kubectl create secret generic github-webhook-token \
    --from-literal=github_webhook_secret_token=${GITHUB_WEBHOOK_SECRET} \
    -n ${NAMESPACE} --dry-run=client -o yaml | \
    kubeseal --controller-namespace=sealed-secrets \
    --format=yaml - > ../k8s/infra/controllers/gh-actions/github-webhook-token.yaml
```
