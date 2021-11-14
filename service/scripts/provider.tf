terraform {
  required_providers {
    template-gcp-provider = {
      source  = "google"
      version = "4.0.0"
    }
  }
}

provider "template-gcp-provider" {
  credentials = file(var.credentials)
  project     = var.project
}
