# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "staticip" {
  source       = "../../"
  zone         = "us-central1-a"
  project      = "pike-477416"
  address_type = "EXTERNAL"
  network      = google_compute_network.this.self_link
  subnetwork   = google_compute_subnetwork.this.self_link
  # Referencing the IAM member orders instance creation after the service agent grant
  kms_key_self_link = google_kms_crypto_key_iam_member.compute_engine.crypto_key_id
}

resource "google_compute_network" "this" {
  name                            = "staticip-example-network"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "this" {
  name                     = "staticip-example-subnet"
  region                   = "us-central1"
  network                  = google_compute_network.this.self_link
  ip_cidr_range            = "10.0.0.0/24"
  private_ip_google_access = true

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

# holden:ignore:HLD_GCP_308
resource "google_compute_route" "default_internet_route" {
  name             = "staticip-example-default-route"
  network          = google_compute_network.this.self_link
  dest_range       = "0.0.0.0/0"
  next_hop_gateway = "default-internet-gateway"
}

# holden:ignore:HLD_GCP_047
resource "google_compute_firewall" "allow_internal" {
  name    = "staticip-example-allow-internal"
  network = google_compute_network.this.self_link

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.0.0.0/8"]
  direction     = "INGRESS"
}


resource "google_kms_crypto_key" "static" {
  name                       = "static"
  key_ring                   = google_kms_key_ring.static.id
  rotation_period            = "7776000s"
  destroy_scheduled_duration = "2592000s"
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_key_ring" "static" {
  name     = "static"
  location = "us-central1"
}

data "google_project" "current" {
  project_id = "pike-477416"
}

resource "google_kms_crypto_key_iam_member" "compute_engine" {
  crypto_key_id = google_kms_crypto_key.static.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${data.google_project.current.number}@compute-system.iam.gserviceaccount.com"
}
