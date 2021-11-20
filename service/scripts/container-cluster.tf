resource "google_container_cluster" "template-gke-cluster" {
  name     = "template-gke-cluster"
  location = var.location

  remove_default_node_pool = true
  initial_node_count       = 1
  monitoring_service       = "none"
  logging_service          = "none"

  network    = google_compute_network.template-network.id
  subnetwork = google_compute_subnetwork.template-subnetwork.id

  ip_allocation_policy {
    # allocation ip addresses for services
    cluster_secondary_range_name  = google_compute_subnetwork.template-subnetwork.secondary_ip_range.0.range_name
    # allocation ip addresses for pods
    services_secondary_range_name = google_compute_subnetwork.template-subnetwork.secondary_ip_range.1.range_name
  }

}
