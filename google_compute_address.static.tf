resource "google_compute_address" "static" {
  name         = var.name
  project      = var.project
  region       = local.region
  address_type = var.address_type
  subnetwork   = local.address_subnetwork

  lifecycle {
    prevent_destroy = true
  }
}
