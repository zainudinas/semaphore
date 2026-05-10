terraform {
required_providers {
proxmox = {
source = "telmate/proxmox"
version = "3.0.2-rc04"
}
}
}
provider "proxmox" {
pm_api_url = "https://IPv4-address-of-your-server:8006/api2/json"
pm_api_token_id = "Proxmox_user@token_ID"
pm_api_token_secret = "Token_string"
pm_tls_insecure = true
}
resource "proxmox_vm_qemu" "name" {
name = "VM_name"
target_node = "Node_name"
clone = "Template_name"
full_clone = true
boot = "order=scsi0"
cores = 2
sockets = 1
memory = 2048
disks {
scsi {
scsi0 {
disk {
size = "75G"
storage = "local-lvm"
discard = true
}
}
}
}
network {
id = 0
model = "virtio"
bridge = "vmbr0"
firewall = false
}
}
