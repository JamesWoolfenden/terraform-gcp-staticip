# holden:ignore:HLD_GCP_005 — this module's purpose is to demonstrate static external IP assignment
resource "google_compute_instance" "instance_with_ip" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian.self_link
    }
    kms_key_self_link = var.kms_key_self_link
  }

  allow_stopping_for_update = true

  deletion_protection = true

  confidential_instance_config {
    enable_confidential_compute = true
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
    enable_secure_boot          = true
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    network_ip = local.internal ? google_compute_address.static.address : null

    dynamic "access_config" {
      for_each = local.access_configs
      content {
        nat_ip = access_config.value
      }
    }
  }

  metadata = {
    block-project-ssh-keys = true
    enable-oslogin         = true
  }

  service_account {
    email  = google_service_account.instance.email
    scopes = var.service_account_scopes
  }

  lifecycle {
    # The image comes from a family lookup; without this every new image release
    # plans a replacement, which deletion_protection then blocks.
    ignore_changes = [boot_disk[0].initialize_params[0].image]

    precondition {
      condition     = local.confidential_series_ok
      error_message = "Confidential Computing is enabled; machine_type must be one of the n2d, c2d, c3d, c3 or a3 series (e.g. n2d-standard-2)."
    }
  }
}
