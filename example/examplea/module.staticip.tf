module "staticip" {
  source      = "../../"
  common_tags = var.common_tags
  zone        = "us-central1-a"
}
