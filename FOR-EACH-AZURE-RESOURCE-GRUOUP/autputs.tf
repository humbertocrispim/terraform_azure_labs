output "location-resource-group-eua" {
  value = azurerm_resource_group.resource_group["EUA"].location

}

output "resource-group-europa" {
  value = azurerm_resource_group.resource_group["Europa"].location

}

output "resource-group-asia" {
  value = azurerm_resource_group.resource_group["Asia"].location

}