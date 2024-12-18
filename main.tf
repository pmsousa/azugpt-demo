resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
  
  tags = {
    Owner        = var.owner
    DateCreated  = var.date_created
  }
}