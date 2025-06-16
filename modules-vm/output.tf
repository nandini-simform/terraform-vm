output "rgname" {
  value = var.resource_group_name
}
output "vm_name" {
  value       = var.vm_name
  description = "The name of the virtual machine"
}
output "vm_public_ip" {
  value = azurerm_public_ip.pubip1.ip_address
  description = "The public IP address of the virtual machine"
}