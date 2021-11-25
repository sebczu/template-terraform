provider "template-helm-provider" {
  kubernetes {
    host  = "https://${google_container_cluster.template-gke-cluster.endpoint}"
    token = data.google_client_config.template-gke-client-config.access_token
    cluster_ca_certificate = base64decode(
      google_container_cluster.template-gke-cluster.master_auth[0].cluster_ca_certificate,
    )
  }
}
