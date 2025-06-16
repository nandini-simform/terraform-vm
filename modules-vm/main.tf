resource "tls_private_key" "sshkeys" {
  count     = var.generate_ssh_key ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "azurerm_network_interface" "mynic1" {
  name = var.nic
  resource_group_name = var.resource_group_name
  location = var.resource_group_location

    ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pubip1.id
  }
}


resource "azurerm_linux_virtual_machine" "vm1" {
  name = var.vm_name
  resource_group_name = var.resource_group_name
   location = var.resource_group_location
   size = var.vm_size
   admin_username = var.admin_username
   network_interface_ids = [azurerm_network_interface.mynic1.id]
    dynamic "admin_ssh_key" {
    for_each = var.authentication_type == "ssh" ? [1] : []
    content {
      username   = var.admin_username
      public_key = var.generate_ssh_key ? tls_private_key.sshkeys[0].public_key_openssh : var.public_ssh_key
    }
  }

  dynamic "admin_password" {
    for_each = var.authentication_type == "password" ? [1] : []
    content {
      value = var.admin_password
    }
  }

  disable_password_authentication = var.authentication_type == "password" ? false : true

   os_disk {
     name = "osdisk"
      caching  = "ReadWrite"
      storage_account_type = "Standard_LRS"
   }
   source_image_reference {
     publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
   }

}


