output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "vm_name" {
  value = module.linux_vm.vm_name
}

output "vm_private_ip" {
  value = module.linux_vm.private_ip
}

output "vm_public_ip" {
  value = module.linux_vm.public_ip
}