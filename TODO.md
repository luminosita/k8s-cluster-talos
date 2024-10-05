## 🏗️ Work in Progress

- [ ] Cloudflare Terraform
- [x] DNS resolving from internel K8s network to outside (NFS mount with fixed IP)
- [ ] Renovate
- [ ] Remark42
- [ ] Taskfile
- [x] DNS records: internal (VPN, Cloudflare) and external
- [x] Finish README
- [x] Gollum with local-path provisioner 
- [x] Gollum with storage
- [x] Wiki.js
- [x] VSCode with NFS provisioner
- [ ] Full Coder Environment (coder.com)
- [ ] OWASP

# K8s (Proxmox VMs and DigitalOcean for true HA)
- [x] Terraform
- [ ] Network (https://www.haproxy.com/blog/using-haproxy-as-an-api-gateway-part-1-introduction)
    - [ ] Hubble
    - [ ] Cloudflare Operator
- [x] Storage
- [x] NFS Provisioner
- [ ] Health Checks (https://blog.kubecost.com/blog/kubernetes-health-check/)
- [x] Gateway/Ingress

# SSL
- [x] LetsEnrypt
- [x] Key rotation
- [x] Sealed secrets
- [x] Self-signed CA Issuer for internal apps

# Identity Provider
- [x] Keycloak
    - [ ] OpenLDAP
    - [x] Solar
    - [x] ArgoCD
    - [x] Wikijs
    - [ ] Mattermost
    - [ ] NextCloud
    - [x] OpenId Connect
    - [ ] Coder Full Environment (coder.com)
    - [x] oauth2-proxy
        - [ ] Redis
 
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

# K8s Apps
- [x] VS Code (web)
- [x] Gollum
- [ ] GitKraken
- [ ] Mattermost
- [x] eJabberd K8S cluster
- [ ] Web Socket reverse proxy eJabberd
    - [ ] VPN-Tor side car
- [ ] Emisia SVN Repository on VM
- [ ] Nextcloud (Glasskube operators)
- [ ] Odoo (Glasskube operators)

# Private Artifact Repo
- [ ] JFrog for docker images, VMs, phone images

# Ci/CD
- [ ] GitHub actions / worker nodes
- [x] ArgoCD

# Backup
- [ ] Backup (Velero) 
    - [ ] etcd
    - [ ] PVs

# HA K8s
- [x] HA cluster with embedded etcd (Talos)
- [ ] Kube VIP front loadbalancer
- [ ] BGP
- [ ] RBAC
- [ ] Mesh
- [ ] Mikrotik/pfSense hardening (https://wiki.mikrotik.com/wiki/Manual:Securing_Your_Router#Access_to_a_router)
- [ ] eBPF

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

