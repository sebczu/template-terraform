resource "google_compute_subnetwork" "template-subnetwork" {
  name          = "template-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.template-network.id

  secondary_ip_range {
    range_name    = "service-range"
    ip_cidr_range = "192.168.1.0/24"
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "192.168.64.0/22"
  }
}
