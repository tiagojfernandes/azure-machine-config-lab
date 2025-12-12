variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "location" {
  description = "Azure region for the network resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    address_prefixes = list(string)
  }))
  default = {}
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
}

variable "allow_rdp" {
  description = "Whether to allow RDP access from allowed IPs"
  type        = bool
  default     = true
}

variable "allow_ssh" {
  description = "Whether to allow SSH access from allowed IPs"
  type        = bool
  default     = true
}

variable "allowed_source_ips" {
  description = "List of source IP addresses allowed for RDP/SSH access"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to network resources"
  type        = map(string)
  default     = {}
}
