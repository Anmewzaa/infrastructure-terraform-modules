# ===========================================
# Output : Azurerm Event Hub
# ===========================================
output "id" {
  value = azurerm_eventhub.this.id
}
output "name" {
  value = azurerm_eventhub.this.name
}
output "partition_ids" {
  value = azurerm_eventhub.this.partition_ids
}
