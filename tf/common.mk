PM_TOKEN:=$(shell hcp vault-secrets run --app=Packer -- env | grep PROXMOX_APITOKEN | sed -e s/PROXMOX_APITOKEN=//)
CF_TOKEN:=$(shell hcp vault-secrets run --app=Packer -- env | grep CLOUDFLARE_APITOKEN | sed -e s/CLOUDFLARE_APITOKEN=//)

export TF_VAR_api_token_secret=${PM_TOKEN}



