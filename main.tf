module "vm_module" {
  source                  = "./modules-vm"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  vm_name                 = var.vm_name
  vm_size                 = var.vm_size
  admin_username          = var.admin_username
  authentication_type     = "ssh"
  generate_ssh_key        = true

  image_publisher         = "Canonical"
  image_offer             = "UbuntuServer"
  image_sku               = "18.04-LTS"
  image_version           = "latest"
  nic = var.nic

}