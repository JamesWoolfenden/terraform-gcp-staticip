variable "common_tags" {
  description = "This is a map type for applying tags on resources"
  type        = map(any)
  default     = { module = "terraform-gcp-staticip" }
}
