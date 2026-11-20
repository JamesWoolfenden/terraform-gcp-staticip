resource "google_project_iam_member" "ops" {
  for_each = local.ops_roles

  project = var.project
  role    = each.value
  member  = google_service_account.instance.member
}
