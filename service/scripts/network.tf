resource "google_compute_network" "template-network" {
  name                    = "template-network"
  auto_create_subnetworks = false
}