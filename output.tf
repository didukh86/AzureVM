output "public_ip" {
  value = azurerm_public_ip.didukh-public-ip.ip_address
}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.subscription_id
}