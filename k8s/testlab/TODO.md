# Prepare Test Lab

### Target revision

Replace all occurences of `< branch >` with proper values in 
  - application-set.yaml
  - kustomization.yaml
  - project.yaml

### Add Applications to ArgoCD

```bash
$ kubectl apply -k ../k8s/testlab/
```

# Notes to Fix When Merging into Main Branch

- [ ] Change revision keycloak to HEAD