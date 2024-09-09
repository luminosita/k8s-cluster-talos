###############################  API ##############################
variable "api_token_id" {
    type    = string
}

variable "api_token_secret" {
    type    = string
}


###############################  PROXMOX ##############################

variable "proxmox" {
  type = object({
    name                    = string
    cluster_name            = string
    endpoint                = string
    insecure                = bool
    ssh_username            = string
    ssh_private_key_file    = string
  })
  sensitive = true
}

locals {
  api_token = "${var.api_token_id}=${var.api_token_secret}"
}

#variable "cluster_config" {
#  description = "Talos node configuration"
#  type = object({
#
#    cluster_name    = string
#    proxmox_cluster = string
#    endpoint        = string
#    talos_version   = string
#
#    nodes = map(
#      object({
#        host_node     = string
#        machine_type  = string
#        ip            = string
#        mac_address   = string
#        vm_id         = number
#        cpu           = number
#        ram_dedicated = number
#        update = optional(bool, false)
#        igpu = optional(bool, false)
#      })
#    )
#  })
#
#  validation {
#    condition     = length([
#      for n in var.cluster_config.nodes : n if contains(["controlplane", "worker"], n.machine_type)]) == length(var.cluster_config.nodes)
#    error_message = "Node machine_type must be either 'controlplane' or 'worker'."
#  }
#}
#
#variable "volumes" {
#  type = map(
#    object({
#      node = string
#      size = string
#      storage = optional(string, "local-zfs")
#      vmid = optional(number, 9999)
#      format = optional(string, "raw")
#    })
#  )
#}
