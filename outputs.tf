output "source_image_id" {
  value = data.google_compute_image.image.source_image_id
}

output "source_image_name" {
  value = data.google_compute_image.image.name
}

output "instance_id" {
  value = google_compute_instance.instance_with_ip.instance_id
}
