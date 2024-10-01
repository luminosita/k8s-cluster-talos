## Bugs

- [ ] BUG 1:
Warning: would violate PodSecurity "baseline:latest": non-default capabilities (container "proxmox-csi-plugin-node" must not include "SYS_ADMIN" in securityContext.capabilities.add), hostPath volumes (volumes "socket", "registration", "kubelet", "dev", "sys"), privileged (container "proxmox-csi-plugin-node" must not set securityContext.privileged=true)
daemonset.apps/proxmox-csi-plugin-node created

- [ ] BUG 2:
ERR_TOO_MANY_REDIRECTS with Proxied DNS Record

- [ ] BUG 3:
CNPG 
bootstrap:
    initdb: 
Destroys existing DB and always creates new DB regardless


## 🏗️ Work in Progress

- [ ] Cloudflare Terraform
- [ ] DNS resolving from internel K8s network to outside (NFS mount with fixed IP)
- [ ] Renovate
- [ ] Remark42
- [ ] Taskfile
- [ ] DNS records: internal (VPN, Cloudflare) and external
- [x] Finish README
- [x] Gollum with local-path provisioner 
- [x] Gollum with storage
- [x] Wiki.js
- [x] VSCode with NFS provisioner 

# K8s (Proxmox VMs and DigitalOcean for true HA)
- [x] Terraform
- [ ] Network (https://www.haproxy.com/blog/using-haproxy-as-an-api-gateway-part-1-introduction)
    - [ ] Hubble
    - [ ] Cloudflare Operator
- [x] Storage
- [x] NFS Provisioner
- [ ] Health Checks (https://blog.kubecost.com/blog/kubernetes-health-check/)
- [x] Gateway/Ingress
- [ ] Crossplane

# SSL
- [x] LetsEnrypt
- [x] Key rotation
- [x] Sealed secrets
- [x] Self-signed CA Issuer for internal apps

# Identity Provider
- [ ] Keycloak
    - [ ] OpenLDAP
    - [ ] Solar
    - [ ] ArgoCD
    - [ ] Wikijs
    - [ ] Mattermost
    - [ ] OpenId Connect
    - [ ] Android VSCode
 
# Monitoring 
- [ ] Prometheus/Grafana (https://medium.com/@abdullah.eid.2604)
- [ ] OpenObserve (https://datavirke.dk/posts/bare-metal-kubernetes-part-10-metrics-and-monitoring-with-openobserve/)
- [ ] Telemetry
- [ ] Aggregated Logs
- [ ] Audit
- [ ] Sentry
    - [ ] Proxmox
    - [ ] K8s
    - [ ] Databases
    - [ ] etcd

# Databases
- [x] Postgre
- [ ] MySql (MariaDB)
- [x] OpenLDAP
- [x] Minio Dev

# K8s
- [ ] Dashboard (Ingress, SSL, Pomerium with GitHub and LDAP)
- [ ] Backup (Velero) 
    - [ ] etcd
    - [ ] Databases
    - [ ] PVs

# K8s Apps
- [x] VS Code (web)
- [x] Gollum
- [ ] GitKraken
- [ ] Mattermost
- [x] eJabberd K8S cluster
- [ ] Web Socket reverse proxy eJabberd
    - [ ] VPN-Tor side car
- [ ] Emisia SVN Repository on VM

# Private Artifact Repo
- [ ] JFrog for docker images, VMs, phone images

# HA K8s
- [x] HA cluster with embedded etcd (Talos)
- [ ] Kube VIP front loadbalancer
- [ ] BGP
- [ ] RBAC
- [ ] Mesh
- [ ] Mikrotik/pfSense hardening
- [ ] eBPF

# Ci/CD
- [ ] GitHub actions / worker nodes
- [ ] Trigger create VM on checkin (Crossplane)
- [x] ArgoCD

# DCIM
- [ ] Thinkerbell
- [ ] NetBox

# Storage
- [ ] Ceph/Rook/Proxmox/CSI Plugin
- [ ] Type of storage (fast, slow, archive, backup, block, file, object)

# Misc
- [ ] K8s on bare metal vs VMs (hyperconverged) 
- [ ] Build Cache for Android compilation and Gradle Android apps
https://blog.gradle.org/remote-and-distributed-build-patterns
- [ ] DistCC
https://www.linux-magazine.com/Online/Features/Distributed-Compiling-with-distcc

