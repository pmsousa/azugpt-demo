variable "resource_group_location" {
  type        = string
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "azugpt-demo"
  description = "Name of the resource group."
}

variable "owner" {
  type        = string
  description = "Owner of the resources"
  default     = "Pedro Sousa"
}

variable "date_created" {
  type        = string
  description = "Creation date of the resources"
  #default     = "2024-12-18"  # Replace with current date in YYYY-MM-DD format
  default = substr(timestamp(), 0, 10)
}

variable "prefix" {
  type        = string
  description = "Prefix for all resource names"
  default     = "demo"
}