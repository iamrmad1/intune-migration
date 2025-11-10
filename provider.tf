terraform {
  required_providers {
    msgraph = {
      source  = "microsoftgraph/msgraph"
      version = "0.13.0"
    }
  }
}

provider "msgraph" {
  client_id     = var.client_id
  client_secret = var.client_secret
  tenant_id     = var.tenant_id
}
