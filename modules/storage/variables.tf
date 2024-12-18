variable "prefix" {
  type        = string
  description = "Prefix for storage account name"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region location"
}

variable "owner" {
  type        = string
  description = "Owner of the resources"
}

variable "date_created" {
  type        = string
  description = "Creation date of the resources"
}
