variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}


variable "nic" {
  description = "Name of the network interface"
  type        = string
}

variable "image_publisher" {
  description = "VM image publisher"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "VM image offer"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  description = "VM image SKU"
  type        = string
  default     = "22_04-lts"
}

variable "image_version" {
  description = "VM image version"
  type        = string
  default     = "latest"
}
variable "generate_ssh_key" {
  description = "Whether to generate a new SSH key or use a provided one"
  type        = bool
  default     = true
}

variable "public_ssh_key" {
  description = "The public SSH key to use when generate_ssh_key is false"
  type        = string
  default     = ""
}
variable "authentication_type" {
  description = "Authentication method: ssh or password"
  type        = string
  default     = "ssh"
  validation {
    condition     = contains(["ssh", "password"], var.authentication_type)
    error_message = "authentication_type must be either 'ssh' or 'password'."
  }
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the VM (required if authentication_type is 'password')"
  type        = string
  default     = ""
  sensitive   = true
}
