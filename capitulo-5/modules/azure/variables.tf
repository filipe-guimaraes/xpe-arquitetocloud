variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
  default     = "xpe"
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
  sensitive   = true
  default     = "Admin@2025" # Change this to a secure password
}

variable "vnet_name" {
  description = "The name of the Azure virtual network"
  type        = string
}

variable "vm_size" {
  description = "The size of the Azure virtual machine"
  type        = string  
}