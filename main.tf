resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
  
  tags = {
    Owner        = var.owner
    DateCreated  = var.date_created
  }
}

module "storage" {
  source = "./modules/storage"

  prefix              = var.prefix
  resource_group_name = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
  owner              = var.owner
  date_created       = var.date_created
}

resource "azurerm_storage_container" "container" {
  name                  = "demo"
  storage_account_name  = azurerm_storage.storage.name
  container_access_type = "private"
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.prefix}registry"
  resource_group_name = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
  sku                = "Basic"
  admin_enabled      = true
}

resource "azurerm_service_plan" "appservice" {
  name                = "${var.prefix}-app-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
  os_type            = "Linux"
  sku_name           = "B1"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "${var.prefix}-webapp"
  resource_group_name = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
  service_plan_id    = azurerm_service_plan.appservice.id

  site_config {
    always_on = true
  }
}