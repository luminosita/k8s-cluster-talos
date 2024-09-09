# k8s-cluster-talos

```bash
$ cd tf
$ make talos
```
```bash
$ make gateway
```

```bash
$ brew install argocd
```

```bash
$ argocd admin initial-password -n argocd
XXX
```

```bash
$ argocd login argocd.emisia.net:80
```
(yes)
user: admin
password: XXX

```bash
$ argocd account update-password
```
```bash
$ kubectl config get-contexts -o name
admin@talos
```
```bash
$ argocd cluster add admin@talos
```