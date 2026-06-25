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
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}