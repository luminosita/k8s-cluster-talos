TOKEN:=$(shell hcp vault-secrets run --app=Packer -- env | grep PROXMOX_APITOKEN | sed -e s/PROXMOX_APITOKEN=//)

export TF_VAR_api_token_secret=${TOKEN}


