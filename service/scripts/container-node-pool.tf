resource "google_container_node_pool" "template-gke-node-pool" {
  name       = "template-gke-node-pool"
  location   = var.location
  cluster    = google_container_cluster.template-gke-cluster.name
  node_count = 1
  version    = var.kubernetes-version

  node_config {
    image_type        = "COS_CONTAINERD"
    preemptible       = true
    machine_type      = "e2-highcpu-4"
    local_ssd_count   = 0
    disk_size_gb      = 10
  }
}