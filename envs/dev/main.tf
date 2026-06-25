module "resource_group" {
  source              = "../../modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "network" {
  source                  = "../../modules/network"
  resource_group_name     = module.resource_group.resource_group_name
  location                = var.location
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  tags                    = var.tags
}

module "security" {
  source                = "../../modules/security"
  resource_group_name   = module.resource_group.resource_group_name
  location              = var.location
  nsg_name              = var.nsg_name
  subnet_id             = module.network.subnet_id
  allowed_ssh_source_ip = var.allowed_ssh_source_ip
  tags                  = var.tags
}

module "linux_vm" {
  source              = "../../modules/linux_vm"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  admin_username      = var.vm_admin_username
  ssh_public_key      = var.ssh_public_key
  nic_name            = var.nic_name
  subnet_id           = module.network.subnet_id
  vm_public_ip_name   = var.vm_public_ip_name
  tags                = var.tags

  depends_on = [
    module.security
  ]
}