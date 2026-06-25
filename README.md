# Azure VM Terraform Demo

This repository deploys an Azure Linux VM using Terraform with a modular code structure.

## Resources deployed
- Resource Group
- VNet + Subnet
- Network Security Group
- Public IP
- NIC
- Ubuntu Linux VM
- Python + pip + Nginx installation via cloud-init

## CI/CD
- Source code stored in GitHub
- Azure DevOps pipelines for:
  - PR validation
  - Main deployment

## Terraform backend
Terraform state is stored in Azure Storage Account backend.