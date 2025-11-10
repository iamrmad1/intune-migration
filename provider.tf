terraform {
  required_providers {
    graph = {
      source  = "YungSang/graph"
      version = "0.1.8"
    }
  }
}

provider "graph" {
  tenant_id     = var.tenant_id
  client_id     = var.client_id
  client_secret = var.client_secret
}
