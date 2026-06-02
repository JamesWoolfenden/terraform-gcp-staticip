# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "staticip" {
  source       = "../../"
  zone         = "us-central1-a"
  project      = "pike-477416"
  address_type = "EXTERNAL"
  network      = google_compute_network.this.self_link
}

resource "google_compute_network" "this" {
  #checkov:skip=CKV2_GCP_18: example module — callers define their own firewall rules
  name                            = "staticip-example-network"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}
