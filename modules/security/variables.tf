variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "nsg_name" {
  description = "NSG name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "allowed_ssh_source_ip" {
  description = "Allowed source IP for SSH in /32 format"
  type        = string

  validation {
    condition     = can(cidrhost(var.allowed_ssh_source_ip, 0)) && var.allowed_ssh_source_ip != "YOUR_PUBLIC_IP/32"
    error_message = "allowed_ssh_source_ip must be a real CIDR block such as 203.0.113.10/32, not the placeholder value."
  }
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
