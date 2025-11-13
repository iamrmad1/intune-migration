terraform {
  required_providers {
    msgraph = {
      source  = "Microsoft/msgraph"
      version = ">= 0.2.0"
    }
  }
}

provider "msgraph" {
  tenant_id     = var.tenant_id
  client_id     = var.client_id
  client_secret = var.client_secret
}
