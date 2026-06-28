variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "vm_size" {
  description = "VM size"
  type        = string
}

variable "admin_username" {
  description = "Admin username"
  type        = string

  validation {
    condition     = !contains(["admin", "administrator", "root"], lower(var.admin_username))
    error_message = "admin_username must not be admin, administrator, or root."
  }
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string

  validation {
    condition     = can(regex("^(ssh-rsa|ssh-ed25519|ecdsa-sha2-nistp[0-9]+)\\s+[A-Za-z0-9+/=]+(\\s+[^\\r\\n]+)?$", trimspace(var.ssh_public_key))) && trimspace(var.ssh_public_key) != "PASTE-YOUR-SSH-PUBLIC-KEY-HERE"
    error_message = "ssh_public_key must be a real single-line OpenSSH public key such as the contents of id_rsa.pub or id_ed25519.pub, not a private key, file path, or placeholder value."
  }
}

variable "nic_name" {
  description = "NIC name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "vm_public_ip_name" {
  description = "VM public IP name"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
