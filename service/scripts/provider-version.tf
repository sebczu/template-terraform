terraform {
  required_providers {
    template-gcp-provider = {
      source  = "google"
      version = "4.0.0"
    }

    template-helm-provider = {
      source  = "helm"
      version = "2.4.1"
    }

    template-kubernetes-provider = {
      source  = "kubernetes"
      version = "2.6.1"
    }
  }
}