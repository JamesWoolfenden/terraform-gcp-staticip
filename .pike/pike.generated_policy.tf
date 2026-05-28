
resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike-477416"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "compute.addresses.create",
    "compute.addresses.delete",
    "compute.addresses.get",
    "compute.addresses.setLabels",
    "compute.disks.create",
    "compute.disks.setLabels",
    "compute.instances.create",
    "compute.instances.delete",
    "compute.instances.get",
    "compute.instances.setLabels",
    "compute.instances.setMetadata",
    "compute.instances.stop",
    "compute.instances.updateNetworkInterface",
    "compute.networks.use",
    "compute.subnetworks.use",
    "compute.subnetworks.useExternalIp",
    "compute.zones.get"
  ]
}
