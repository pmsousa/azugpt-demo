resource "azurerm_storage_account" "storage" {
  name                     = "${var.prefix}storage${random_string.random.result}"
  resource_group_name      = var.resource_group_name
  location                = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    owner        = var.owner
    date_created = var.date_created
  }
}

resource "random_string" "random" {
  length  = 8
  special = false
  upper   = false
}
