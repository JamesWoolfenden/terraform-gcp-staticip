
variable "name" {
  description = "Name of the instance, static address and service account (account_id). 6-30 characters: lowercase letters, digits and hyphens, starting with a letter."
  default     = "instance-1"
  type        = string
  validation {
    condition     = can(regex("^[a-z]([-a-z0-9]{4,28}[a-z0-9])$", var.name))
    error_message = "The name must be 6-30 characters, start with a lowercase letter, contain only lowercase letters, digits and hyphens, and not end with a hyphen."
  }
}

variable "image" {
  description = "Instance Image"
  type = object({
    family  = string
    project = string
  })
  default = {
    family  = "debian-13"
    project = "debian-cloud"
  }
  validation {
    condition     = length(var.image.family) > 0 && length(var.image.project) > 0
    error_message = "The image family and project must not be empty."
  }
}

variable "machine_type" {
  description = "Instance machine type. Confidential Computing is always enabled, so this must be an n2d, c2d, c3d, c3 or a3 series type."
  type        = string
  default     = "n2d-standard-2"
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
    condition     = length(var.network) > 0 && !can(regex("(^|/)default$", var.network))
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

variable "kms_key_self_link" {
  description = "Cloud KMS key (CMEK) ID used to encrypt the boot disk. The key must be in the instance's region and the Compute Engine service agent needs roles/cloudkms.cryptoKeyEncrypterDecrypter on it."
  type        = string
  validation {
    condition     = length(var.kms_key_self_link) > 0
    error_message = "The kms_key_self_link variable must not be empty."
  }
}

variable "subnetwork" {
  description = "The name or self_link of the subnetwork, in the region of var.zone, to attach the instance to. An INTERNAL address is reserved from this subnetwork."
  type        = string
  validation {
    condition     = length(var.subnetwork) > 0
    error_message = "The subnetwork variable must not be empty."
  }
}

variable "grant_ops_roles" {
  description = "Grant the instance service account roles/logging.logWriter and roles/monitoring.metricWriter on the project, so the logging/monitoring scopes actually work."
  type        = bool
  default     = true
}
