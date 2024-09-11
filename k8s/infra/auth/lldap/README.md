# Configure Light LDAP

### Setup Environment Variables

```bash
NAMESPACE=lldap \
LLDAP_JWT_SECRET=`node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"` \
LLDAP_BASE_DN=dc=emisia,dc=net \
LLDAP_LDAP_USER_PASS=<admin password>
```

> **_NOTE:_** Alternatively, use `https://jwtsecret.com/generate` to generate `LLDAP_JWT_SECRET`. Length 32 is good enough

### Create Sealed Secret for lldap credentials

```bash
kubectl create secret generic lldap-credentials \
  --from-literal=LLDAP_JWT_SECRET=${LLDAP_JWT_SECRET} \
  --from-literal=LLDAP_LDAP_USER_PASS=${LLDAP_LDAP_USER_PASS} \
  --from-literal=LLDAP_BASE_DN=${LLDAP_BASE_DN} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/auth/lldap/lldap-credentials.yaml
```
# Bootstrap Light LDAP

## Create Users/Groups Configurations

#### Example single user (`users.json'):

```json
{
    "id": "username",
    "email": "username@example.com",
    "password": "changeme",
    "displayName": "Display Name",
    "firstName": "First",
    "lastName": "Last",
    "avatar_file": "/path/to/avatar.jpg",
    "avatar_url": "https://i.imgur.com/nbCxk3z.jpg",
    "gravatar_avatar": "false",
    "weserv_avatar": "false",
    "groups": [
      "group-1"
    ]
}
```

#### Example multiple users (`users.json'):

> **_NOTE:_** JSON file for users and groups is invalid JSON file by design

```json
{
    "id": "username",
    "email": "username@example.com",
    "password": "changeme",
    "displayName": "Display Name",
    "firstName": "First",
    "lastName": "Last",
    "avatar_file": "/path/to/avatar.jpg",
    "avatar_url": "https://i.imgur.com/nbCxk3z.jpg",
    "gravatar_avatar": "false",
    "weserv_avatar": "false",
    "groups": [
      "group-1",
      "group-2"
    ]
}
{
  "id": "username1",
  "email": "username1@example.com",
  "password": "changeme",
  "displayName": "Display Name",
  "firstName": "First",
  "lastName": "Last",
  "avatar_file": "/path/to/avatar.jpg",
  "avatar_url": "https://i.imgur.com/nbCxk3z.jpg",
  "gravatar_avatar": "false",
  "weserv_avatar": "false",
  "groups": [
    "group-1",
    "group-2"
  ]
}
```
#### Example single group (`groups.json'):

```json
{
    "name": "group-1"
}
```

#### Example multiple groups (`groups.json'):

> **_NOTE:_** JSON file for users and groups is invalid JSON file by design

```json
{
    "name": "group-1"
}
{
    "name": "group-2"
}
```

### Create Sealed Secret for Light LDAP Bootstrap

```bash
$ kubectl create secret generic lldap-config \
  --from-file=users.json=users.json \
  --from-file=groups.json=groups.json \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml  - > ../k8s/infra/auth/lldap/lldap-config.yaml
  ```

  > **_NOTE_**: Files `users.json` and `groups.json` can be deleted