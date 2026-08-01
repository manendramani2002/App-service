resource "azurerm_resource_group" "rg" {
  name     = "rg-appservice"
  location = "Central India"
}

resource "azurerm_service_plan" "plan" {
  name                = "appservice-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  os_type  = "Linux"
  sku_name = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "manendra-react-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      node_version = "22-lts"
    }
  }
}

resource "azurerm_app_service_source_control" "github" {

  app_id   = azurerm_linux_web_app.app.id

  repo_url = "https://github.com/manendramani2002/App-service"

  branch = "main"

  use_manual_integration = true
}