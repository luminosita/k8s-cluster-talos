terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    proxmox = {
      source  = "bpg/proxmox"
    }
  }
}
