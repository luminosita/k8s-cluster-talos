## Bugs

- [ ] BUG 1:
Warning: would violate PodSecurity "baseline:latest": non-default capabilities (container "proxmox-csi-plugin-node" must not include "SYS_ADMIN" in securityContext.capabilities.add), hostPath volumes (volumes "socket", "registration", "kubelet", "dev", "sys"), privileged (container "proxmox-csi-plugin-node" must not set securityContext.privileged=true)
daemonset.apps/proxmox-csi-plugin-node created

- [ ] BUG 2:
http://whoami.emisia.net prolazi
https://emisia.net/whoami - samo kroz curl

- [ ] BUG 3:
ERR_TOO_MANY_REDIRECTS with Proxied DNS Record


## 🏗️ Work in Progress

- [ ] Renovate
- [ ] Remark42
- [ ] Ansible instead of Makefile or Taskfile
- [x] Finish README
- [x] Gollum with local-path provisioner 
- [x] Gollum with storage
- [ ] Wiki.js
- [ ] VSCode with local-path provisioner 

# K8s (Proxmox VMs and DigitalOcean for true HA)
- [x] Terraform
- [x] Network
- [x] Storage
- [ ] Health Checks (https://blog.kubecost.com/blog/kubernetes-health-check/)
- [x] Gateway/Ingress

# SSL
- [x] LetsEnrypt
- [x] Key rotation
- [x] Sealed secrets

# Identity Provider
- [ ] Keycloak, Dex, Pomerium (LDAP, Google, GitHub)

# Monitoring 
- [ ] Prometheus/Grafana (https://medium.com/@abdullah.eid.2604)
- [ ] Sentry
 - [ ] Proxmox
 - [ ] K8s
 - [ ] Databases

# Databases
- [ ] Postgre
- [ ] MySql (MariaDB)

# K8s
- [ ] Dashboard (Ingress, SSL, Pomerium with GitHub and LDAP)
- [ ] Egress (VPN/Tor)
- [ ] Backup (Velero) 

# K8s Apps
- [ ] VS Code (web)
- [x] Gollum
- [ ] GitKraken
- [ ] Mattermost
- [ ] eJabberd K8S cluster
- [ ] VPN failover connections
- [ ] Emisia SVN Repository on VM
- [ ] Mikrotik/pfSense hardening
- [ ] eBPF

# Private Artifact Repo
- [ ] JFrog for docker images, VMs, phone images

# HA K8s
- [x] HA cluster with embedded etcd (Talos)
- [ ] Kube VIP front loadbalancer
- [ ] BGP
- [ ] RBAC
- [ ] Mesh

# Ci/CD
- [ ] GitHub actions / worker nodes
- [ ] Trigger create VM on checkin
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

