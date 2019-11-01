variable common_tags {
  description = "This is a map type for applying tags on resources"
  type        = map
}

variable name {
  default = "ipv4-address"
}

variable image {
  type = map
  default = {
    family  = "debian-9"
    project = "debian-cloud"
  }
}

variable machine_type {
  type    = string
  default = "f1-micro"
}

variable zone {
  type    = string
  default = "us-central1-a"
}
