locals {
  resource_group_name = "rg-${var.environment}"

  tags = {
    managedBy   = "Terraform"
    environment = var.environment
  }
}
