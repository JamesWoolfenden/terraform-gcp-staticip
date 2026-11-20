locals {
  # zone is "<region>-<letter>", e.g. us-central1-a -> us-central1
  region = join("-", slice(split("-", var.zone), 0, 2))

  internal = var.address_type == "INTERNAL"

  # INTERNAL: reserve in the subnetwork and use as the primary IP.
  # EXTERNAL: attach as the NAT IP of a single access_config.
  address_subnetwork = local.internal ? var.subnetwork : null
  access_configs     = local.internal ? [] : [google_compute_address.static.address]

  # Machine series that support Confidential Computing (AMD SEV / Intel TDX)
  confidential_series    = ["n2d", "c2d", "c3d", "c3", "a3"]
  confidential_series_ok = contains(local.confidential_series, split("-", var.machine_type)[0])
  ops_roles              = var.grant_ops_roles ? toset(["roles/logging.logWriter", "roles/monitoring.metricWriter"]) : toset([])
}
