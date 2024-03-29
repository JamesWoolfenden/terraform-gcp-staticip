resource "google_compute_instance" "instance_with_ip" {
  # TODO:
  #checkov:skip=CKV_GCP_30: "Ensure that instances are not configured to use the default service account"
  #checkov:skip=CKV_GCP_38: "Ensure VM disks for critical VMs are encrypted with Customer Supplied Encryption Keys (CSEK)"
  #checkov:skip=CKV_GCP_40: intent
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.image.self_link
    }
  }

  allow_stopping_for_update = true

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
    enable_secure_boot          = true
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  metadata = {
    block-project-ssh-keys = true
  }

}
