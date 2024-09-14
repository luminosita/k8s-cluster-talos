# Prepare Test Lab

### Target revision

Add targetRevision into `application-set.yaml`

```yaml
. . .
  generators:
    - git:
        repoURL: https://github.com/luminosita/k8s-cluster-talos
        revision: <branch>
        directories:
          - path: k8s/testlab/*
. . .
      source:
        plugin:
          name: kustomize-build-with-helm
        repoURL: https://github.com/luminosita/k8s-cluster-talos
        targetRevision: <branch>
        path: '{{ path }}'
```

### Namespaces and Source Code Repositories

Add namespaces from test apps and additional source code repositories, if needed

```yaml
. . .
  sourceRepos:
    - 'https://github.com/luminosita/k8s-cluster-talos'
  destinations:
    - namespace: 'argocd'
      server: '*'
```

### Add Applications to ArgoCD

```bash
$ kubectl apply -k ../k8s/testlab/
```

# Notes to Fix When Merging into Main Branch

- [ ]