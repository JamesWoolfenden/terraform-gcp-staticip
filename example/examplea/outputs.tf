output "source_image_id" {
  value       = module.staticip.source_image_id
  description = "The unique identifier for the source image used for the instance's boot disk."
}

output "instance_id" {
  value       = module.staticip.instance_id
  description = "The unique identifier for the instance."
}

output "source_image_name" {
  value       = module.staticip.source_image_name
  description = "The name of the source image used for the instance's boot disk."
}

output "service_account_email" {
  value       = module.staticip.service_account_email
  description = "The email of the dedicated service account created for the instance."
}
