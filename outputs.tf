data "azurerm_subscription" "current_subscription" {

}

output "subscription_name" {
    value = data.azurerm_subscription.current_subscription.display_name
  
}
output "subscription_id" {
    value = data.azurerm_subscription.current_subscription.id
  
}
output "subscription_spending_limit" {
    value = data.azurerm_subscription.current_subscription.spending_limit
  
}
