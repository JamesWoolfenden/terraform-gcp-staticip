
variable "name" {
  description = "Name of the instance"
  default     = "instance-1"
  type        = string
  validation {
    condition     = length(var.name) > 0
    error_message = "The name variable must not be empty."
  }
}

variable "image" {
  description = "Instance Image"
  type        = map(any)
  default = {
    family  = "debian-13"
    project = "debian-cloud"
  }
  validation {
    condition     = length(var.image) > 0
    error_message = "The image variable must not be empty."
  }
}

variable "machine_type" {
  description = "Instance machine type"
  type        = string
  default     = "f1-micro"
  validation {
    condition     = length(var.machine_type) > 0
    error_message = "The machine_type variable must not be empty."
  }
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
  validation {
    condition     = length(var.zone) > 0
    error_message = "The zone variable must not be empty."
  }
}

variable "project" {
  description = "GCP Project ID"
  type        = string
  validation {
    condition     = length(var.project) > 0
    error_message = "The project variable must not be empty."
  }
}

variable "address_type" {
  description = "The type of the address to reserve. Valid values are EXTERNAL or INTERNAL."
  type        = string
  default     = "EXTERNAL"
  validation {
    condition     = var.address_type == "EXTERNAL" || var.address_type == "INTERNAL"
    error_message = "The address_type variable must be either 'EXTERNAL' or 'INTERNAL'."
  }
}

variable "network" {
  description = "The name or self_link of the VPC network to which the instance will be connected. Must not be the default network."
  type        = string
  validation {
    condition     = length(var.network) > 0 && var.network != "default"
    error_message = "The network variable must not be empty or use the default VPC."
  }
}

variable "service_account_scopes" {
  description = "OAuth scopes for the instance service account. Defaults to logging and monitoring only. Do not use 'cloud-platform'."
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring"]
  validation {
    condition     = !contains(var.service_account_scopes, "cloud-platform") && !contains(var.service_account_scopes, "https://www.googleapis.com/auth/cloud-platform")
    error_message = "The cloud-platform scope grants full GCP API access. Use specific scopes instead."
  }
}
