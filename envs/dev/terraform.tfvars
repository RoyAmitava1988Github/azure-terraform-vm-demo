subscription_id = "5e505102-8df1-4067-9cd2-9d323b1fe3fd"

location = "West Europe"

resource_group_name = "rg-azvm-euw-dev-01"

vnet_name          = "vnet-azvm-euw-dev-01"
vnet_address_space = ["10.20.0.0/16"]

subnet_name             = "snet-app-euw-dev-01"
subnet_address_prefixes = ["10.20.1.0/24"]

nsg_name = "nsg-app-euw-dev-01"

vm_name           = "vm-linux-euw-dev-01"
vm_size           = "Standard_B2ats_v2"
vm_admin_username = "azureuser"

nic_name          = "nic-vm-linux-euw-dev-01"
vm_public_ip_name = "pip-vm-linux-euw-dev-01"

ssh_public_key        = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDLzr/9ElpYTHE/H+/VhMED+YLqdPC4ZWahqRj6W1Vfh azure-vm-admin"
allowed_ssh_source_ip = "49.37.123.10/32"

tags = {
  environment = "dev"
  application = "azure-vm-demo"
  owner       = "amitava"
}