# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "staticip" {
  source      = "../../"
  common_tags = var.common_tags
  zone        = "us-central1-a"
}
