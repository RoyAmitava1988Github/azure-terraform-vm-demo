variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string

  validation {
    condition     = can(regex("^[0-9a-fA-F-]{36}$", var.subscription_id))
    error_message = "subscription_id must be a valid Azure subscription GUID."
  }
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Subnet CIDR ranges"
  type        = list(string)
}

variable "nsg_name" {
  description = "Network Security Group name"
  type        = string
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
}

variable "vm_size" {
  description = "Virtual machine size"
  type        = string
}

variable "vm_admin_username" {
  description = "VM admin username"
  type        = string

  validation {
    condition     = !contains(["admin", "administrator", "root"], lower(var.vm_admin_username))
    error_message = "vm_admin_username must not be admin, administrator, or root."
  }
}

variable "nic_name" {
  description = "Network interface name"
  type        = string
}

variable "vm_public_ip_name" {
  description = "Public IP name"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string

  validation {
    condition     = can(regex("^(ssh-rsa|ssh-ed25519|ecdsa-sha2-nistp[0-9]+)\\s+[A-Za-z0-9+/=]+(\\s+[^\\r\\n]+)?$", trimspace(var.ssh_public_key))) && trimspace(var.ssh_public_key) != "PASTE-YOUR-SSH-PUBLIC-KEY-HERE"
    error_message = "ssh_public_key must be a real single-line OpenSSH public key such as the contents of id_rsa.pub or id_ed25519.pub, not a private key, file path, or placeholder value."
  }
}

variable "allowed_ssh_source_ip" {
  description = "Allowed source IP for SSH in CIDR format"
  type        = string

  validation {
    condition     = can(cidrhost(var.allowed_ssh_source_ip, 0)) && var.allowed_ssh_source_ip != "YOUR_PUBLIC_IP/32"
    error_message = "allowed_ssh_source_ip must be a real CIDR block such as 203.0.113.10/32, not the placeholder value."
  }
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
