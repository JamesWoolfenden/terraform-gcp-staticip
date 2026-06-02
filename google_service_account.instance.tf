resource "google_service_account" "instance" {
  account_id   = var.name
  display_name = "Service account for instance ${var.name}"
  project      = var.project
}
