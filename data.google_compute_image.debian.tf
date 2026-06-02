data "google_compute_image" "debian" {
  family  = var.image["family"]
  project = var.image["project"]
}
