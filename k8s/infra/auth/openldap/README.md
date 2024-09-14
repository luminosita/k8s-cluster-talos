# Configure OpenLDAP

### Setup Environment Variables

```bash
NAMESPACE=openldap \
LDAP_ADMIN_PASSWORD=<admin password>
```
### Create Sealed Secret

```bash
kubectl create secret generic openldap-credentials \
  --from-literal=LDAP_ADMIN_PASSWORD=${LDAP_ADMIN_PASSWORD} \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml - > ../k8s/infra/auth/openldap/openldap-credentials.yaml
```
# Bootstrap Light LDAP

## Create Users/Groups Configurations

#### Example single user (`config.ldif'):

```yaml
# Already included in default config of Docker image osixia/openldap:1.5.0.
#
# dn: dc=emisia,dc=net
# objectClass: dcObject
# objectClass: organization
# o: Example Company
# dc: example

dn: ou=People,dc=emisia,dc=net
objectClass: organizationalUnit
ou: People

dn: cn=jane,ou=People,dc=emisia,dc=net
objectClass: person
objectClass: inetOrgPerson
sn: doe
cn: jane
mail: janedoe@example.com
userpassword: foo

dn: cn=john,ou=People,dc=emisia,dc=net
objectClass: person
objectClass: inetOrgPerson
sn: doe
cn: john
mail: johndoe@example.com
userpassword: bar

# Group definitions.

dn: ou=Groups,dc=emisia,dc=net
objectClass: organizationalUnit
ou: Groups

dn: cn=admins,ou=Groups,dc=emisia,dc=net
objectClass: groupOfNames
cn: admins
member: cn=john,ou=People,dc=emisia,dc=net
member: cn=jane,ou=People,dc=emisia,dc=net

dn: cn=developers,ou=Groups,dc=emisia,dc=net
objectClass: groupOfNames
cn: developers
member: cn=jane,ou=People,dc=emisia,dc=net
```

### Create Sealed Secret for Light LDAP Bootstrap

```bash
$ kubectl create secret generic openldap-config \
  --from-file=config-ldap.ldif=bootstrap.ldif \
  -n ${NAMESPACE} --dry-run=client -o yaml | \
  kubeseal --controller-namespace=sealed-secrets \
  --format=yaml  - > ../k8s/infra/auth/openldap/openldap-config.yaml
  ```

  > **_NOTE_**: Files `users.json` and `groups.json` can be deleted