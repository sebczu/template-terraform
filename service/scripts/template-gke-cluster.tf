resource "google_container_cluster" "template-gke-cluster" {
  name     = "template-gke-cluster"
  location = "europe-central2-a"

  remove_default_node_pool = true
  initial_node_count       = 1
  monitoring_service       = "none"
  logging_service          = "none"
}

resource "google_container_node_pool" "template-gke-node-pool" {
  name       = "template-gke-node-pool"
  location   = "europe-central2-a"
  cluster    = google_container_cluster.template-gke-cluster.name
  node_count = 1

  node_config {
    image_type        = "COS_CONTAINERD"
    preemptible       = true
    machine_type      = "e2-medium"
    local_ssd_count   = 0
    disk_size_gb      = 100
  }
}