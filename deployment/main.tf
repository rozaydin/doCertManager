terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }  
  }
  # backend "http" {
  # }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = "do-fra1-tf-k8s-3c4eab1e83"  
}
