output "source_image_id" {
  value       = data.google_compute_image.debian.source_image_id
  description = "The unique identifier for the source image used for the instance's boot disk."
}

output "source_image_name" {
  value       = data.google_compute_image.debian.name
  description = "The name of the source image used for the instance's boot disk."
}

output "instance_id" {
  value       = google_compute_instance.instance_with_ip.instance_id
  description = "The unique identifier for the instance."
}

output "service_account_email" {
  value       = google_service_account.instance.email
  description = "The email of the dedicated service account created for the instance. Grant this SA the roles it needs."
}
