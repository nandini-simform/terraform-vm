module "vm_module" {
  source                  = "./modules-vm"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  vm_name                 = var.vm_name
  vm_size                 = var.vm_size
  virtual_network_name    = ["10.0.0.0/22"]
  subnet_address_space    = ["10.0.1.0/24"]
  vnet_address_space      = var.vnet_address_space
  public_ip_name          = var.public_ip_name
  nic                     = var.nic
  enable_bastion          = false
  enable_nsg = false
  nsg_rules = false
  
}