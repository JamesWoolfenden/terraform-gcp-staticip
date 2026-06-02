resource "google_compute_address" "static" {
  name         = var.name
  project      = var.project
  address_type = var.address_type
}
