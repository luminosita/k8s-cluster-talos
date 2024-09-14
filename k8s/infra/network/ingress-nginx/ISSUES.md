# Issues

### Error:
```
failed calling webhook "validate.nginx.ingress.kubernetes.io": Post https://ingress-nginx-controller-admission.ingress-nginx.svc:443/extensions/v1beta1/ingresses?timeout=30s: x509: certificate is valid for kubernetes, kubernetes.default, kubernetes.default.svc, kubernetes.default.svc.cluster, kubernetes.default.svc.cluster.local, not ingress-nginx-controller-admission.ingress-nginx.svc
```

### Solution:

```bash
$ CA=$(kubectl -n ingress-nginx get secret ingress-nginx-admission -ojsonpath='{.data.ca}')
$ kubectl patch validatingwebhookconfigurations ingress-nginx-admission --type='json' -p='[{"op": "add", "path": "/webhooks/0/clientConfig/caBundle", "value":"'$CA'"}]'
```