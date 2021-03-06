variable "common_tags" {
  description = "This is a map type for applying tags on resources"
  type        = map(any)
}

variable "name" {
  description = "Name of the instance"
  default     = "instance-1"
}

variable "image" {
  description = "Instance Image"
  type        = map(any)
  default = {
    family  = "debian-10"
    project = "debian-cloud"
  }
}

variable "machine_type" {
  description = "Instance machine type"
  type        = string
  default     = "f1-micro"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}
