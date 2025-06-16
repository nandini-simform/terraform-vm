# Terraform Azure VM Module

This repository contains Terraform code to provision an Azure Virtual Machine with optional Azure Bastion Host and Network Security Group (NSG).

## Features

- Create an Azure VM with configurable size and OS image.
- Optionally create an Azure Bastion Host.
- Optionally create and associate an NSG with customizable security rules.
- Modular and reusable Terraform code.

## Prerequisites

- Terraform 1.0+
- Azure CLI (optional, for authentication)
- An Azure subscription

## Usage

1. Clone the repo:

   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
Customize variables in terraform.tfvars or via CLI variables.

Initialize Terraform:

bash
Copy
Edit
terraform init
Review the execution plan:

bash
Copy
Edit
terraform plan
Apply the configuration:

bash
Copy
Edit
terraform apply
Variables
resource_group_name: Name of the resource group.

resource_group_location: Location for resources.

vm_name: Name of the VM.

vm_size: Size of the VM.

enable_bastion: (bool) Whether to create a Bastion Host.

enable_nsg: (bool) Whether to create and associate an NSG.

image_publisher, image_offer, image_sku, image_version: VM image configuration.

nsg_rules: List of NSG rules (optional, if enable_nsg is true).

See variables.tf for full details.

Notes
Ensure you have sufficient permissions in your Azure subscription.

Bastion requires a dedicated subnet named AzureBastionSubnet.

Avoid committing sensitive information such as secrets or SSH private keys.

