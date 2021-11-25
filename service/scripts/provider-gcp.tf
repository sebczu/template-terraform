provider "template-gcp-provider" {
  credentials = file(var.credential-gcloud)
  project     = var.project
}

