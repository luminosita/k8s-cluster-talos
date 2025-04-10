module "talos" {
  source = "./talos"

  providers = {
    proxmox = proxmox
  }

  image = {
    version = "v1.7.6"
    update_version = "v1.7.6" # renovate: github-releases=siderolabs/talos
    schematic = file("${path.module}/talos/image/schematic.yaml")
  }

  cilium = {
    values = file("${path.module}/../../k8s/infra/network/cilium/values.yaml")
    install = file("${path.module}/talos/inline-manifests/cilium-install.yaml")
  }

  cluster = {
    name            = "talos"
    endpoint        = "192.168.50.102"
    gateway         = "192.168.50.1"
    talos_version   = "v1.8"
    proxmox_cluster = "proxmox"
  }

  nodes = {
    "ctrl-00" = {
      host_node     = "proxmox"
      machine_type  = "controlplane"
      ip            = "192.168.50.100"
      mac_address   = "BC:24:11:2E:C8:00"
      vm_id         = 800
      cpu           = 8
      ram_dedicated = 8192
#      igpu          = true
    }
    "ctrl-01" = {
      host_node     = "proxmox"
      machine_type  = "controlplane"
      ip            = "192.168.50.101"
      mac_address   = "BC:24:11:2E:C8:01"
      vm_id         = 801
      cpu           = 8
      ram_dedicated = 8192
#      igpu          = true
    }
    "ctrl-02" = {
      host_node     = "proxmox"
      machine_type  = "controlplane"
      ip            = "192.168.50.102"
      mac_address   = "BC:24:11:2E:C8:02"
      vm_id         = 802
      cpu           = 8
      ram_dedicated = 8192
    }
    "work-00" = {
      host_node     = "proxmox"
      machine_type  = "worker"
      ip            = "192.168.50.110"
      mac_address   = "BC:24:11:2E:A8:00"
      vm_id         = 810
      cpu           = 8
      ram_dedicated = 8192
    }
  }

}

module "sealed_secrets" {
  depends_on = [module.talos]
  source = "./bootstrap/sealed-secrets"

  providers = {
    kubernetes = kubernetes
  }

  // openssl req -x509 -days 365 -nodes -newkey rsa:4096 -keyout sealed-secrets.key -out sealed-secrets.cert -subj "/CN=sealed-secret/O=sealed-secret"
  cert = {
    cert = file("${path.module}/bootstrap/sealed-secrets/certificate/sealed-secrets.cert")
    key = file("${path.module}/bootstrap/sealed-secrets/certificate/sealed-secrets.key")
  }
}

module "proxmox_csi_plugin" {
  depends_on = [module.talos]
  source = "./bootstrap/proxmox-csi-plugin"

  providers = {
    proxmox    = proxmox
    kubernetes = kubernetes
  }

  proxmox = var.proxmox
}

module "volumes" {
  depends_on = [module.proxmox_csi_plugin]
  source = "./bootstrap/volumes"

  providers = {
    restapi    = restapi
    kubernetes = kubernetes
  }

  api_token = local.api_token

  proxmox_api = var.proxmox
  volumes = {
    pv-wikijs = {
      node = "proxmox"
      size = "1G"
    }
    pv-openldap-data = {
      node = "proxmox"
      size = "100M"
    }
    pv-openldap-config = {
      node = "proxmox"
      size = "5M"
    }
    pv-matterhorn = {
      node = "proxmox"
      size = "5G"
    }
    pv-prometheus = {
      node = "proxmox"
      size = "10G"
    }
    pv-keycloak = {
      node = "proxmox"
      size = "2G"
    }
    pv-minio = {
      node = "proxmox"
      size = "10G"
    }
    pv-mariadb = {
      node = "proxmox"
      size = "1G"
    }
    pv-ejabberd = {
      node = "proxmox"
      size = "1G"
    }
    pv-nexus = {
      node = "proxmox"
      size = "50G"
    }
  }
}
