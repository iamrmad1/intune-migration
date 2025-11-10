terraform {
  required_providers {
    microsoft365wp = {
      source  = "microsoft365wp/microsoft365wp"
      version = "0.2.8"
    }
  }
}

provider "microsoft365wp" {
  client_id     = var.client_id
  client_secret = var.client_secret
  tenant_id     = var.tenant_id
}
