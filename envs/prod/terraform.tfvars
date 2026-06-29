subscription_id = "REPLACE-WITH-PROD-SUBSCRIPTION-ID"

location = "West Europe"

resource_group_name = "rg-azvm-euw-prod-01"

vnet_name          = "vnet-azvm-euw-prod-01"
vnet_address_space = ["10.30.0.0/16"]

subnet_name             = "snet-app-euw-prod-01"
subnet_address_prefixes = ["10.30.1.0/24"]

nsg_name = "nsg-app-euw-prod-01"

vm_name           = "vm-linux-euw-prod-01"
vm_size           = "Standard_D2ls_v6"
vm_admin_username = "azureuser"

nic_name          = "nic-vm-linux-euw-prod-01"
vm_public_ip_name = "pip-vm-linux-euw-prod-01"

ssh_public_key        = "PASTE-YOUR-SSH-PUBLIC-KEY-HERE"
allowed_ssh_source_ip = "YOUR_PUBLIC_IP/32"

tags = {
  environment = "prod"
  application = "azure-vm-demo"
  owner       = "amitava"
}
