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

# Identity Provider (Authentication)
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
    - [ ] API Gateway
        - [ ] Redis
    - [ ] OPA OIDC integration (https://www.openpolicyagent.org/docs/latest/oauth-oidc/)
    - [ ] Key rotation
    - [ ] Revoke token

# Authorization
- [ ] OPA
 
# Monitoring 
- [ ] Prometheus/Grafana (https://medium.com/@abdullah.eid.2604)
    - [x] Proxmox
    - [x] K8s
    - [ ] Databases
    - [ ] etcd
- [ ] Telemetry/Grafana Tempo (enable tracing for Loki)
    - [x] Telemetry Collector
    - [ ] Connect with logs
    - [ ] Tyk
    - [ ] Auto-injection (https://opentelemetry.io/docs/kubernetes/operator/automatic/, https://github.com/open-telemetry/opentelemetry-operator/)
- [ ] Alertmanager
- [ ] Audit
    - [ ] K8s Audit Logs (https://araji.medium.com/kubernetes-security-monitor-audit-logs-with-grafana-2ab0063906ce)
    - [ ] Tyk Audit Logs
- [ ] Sentry

# Logs
- [x] Aggregated Logs
    - [x] Proxmox
    - [x] K8s
- [x] Promtail
- [x] Loki (standard vs microservice mode)
- [ ] bitnami/kubernetes-event-exporter
- [ ] Log rotation

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

# API Gateway
- [ ] Tyk
    - [ ]

# Private Artifact Repo
- [ ] JFrog for docker images, VMs, phone images

# Ci/CD
- [x] GitHub actions / worker nodes
- [ ] GitHub modules/submodules
- [ ] GitLab CI/CD
- [x] ArgoCD

# Microservice
- [ ] Build 
- [ ] Error handling
- [ ] Logs, traces, audit logs
- [ ] API
- [ ] Authentication
- [ ] Authorization
- [ ] Docker image
- [ ] Private registry
- [ ] Public CI/CD
- [ ] Private CI/CD 

# Backup
- [ ] Backup (Velero) 
    - [ ] etcd
    - [ ] PVs

# Startup
- Operately

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

