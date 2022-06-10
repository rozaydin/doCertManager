terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.19.0"
    }
  }
}

provider "digitalocean" {
  # Provider is configured using environment variables:
  # DIGITALOCEAN_TOKEN, DIGITALOCEAN_ACCESS_TOKEN  
}

data "digitalocean_kubernetes_versions" "current" {  
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = var.cluster_name
  region  = var.cluster_region
  version = data.digitalocean_kubernetes_versions.current.latest_version

  node_pool {
    name       = "default"    
    # node_count = var.worker_count
    size = var.worker_size
    auto_scale = true
    min_nodes  = var.worker_count
    max_nodes  = var.worker_max_count
  }  
}

