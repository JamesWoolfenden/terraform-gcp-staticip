# terraform-gcp-staticip

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-staticip/workflows/Verify/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-staticip)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-staticip.svg)](https://github.com/JamesWoolfenden/terraform-gcp-staticip/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-gcp-storage.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-gcp-storage/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

Terraform module to provision an instance with a static IP.

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

<img src="https://raw.githubusercontent.com/gist/JamesWoolfenden/b6c8f34576bf74cc1bc505eaf20ed519/raw/bd6e3a650c17f2d4d359af4adce763a600b7754a/terraform-gcp-staticip.svg?sanitize=true">

Include this repository as a module in your existing terraform code:

```terraform
module staticip {
  source      = "JamesWoolfenden/staticip/gcp"
  version     = "0.0.4"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [google_compute_address.static](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_instance.instance_with_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_service_account.instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_compute_image.debian](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_address_type"></a> [address\_type](#input\_address\_type) | The type of the address to reserve. Valid values are EXTERNAL or INTERNAL. | `string` | `"EXTERNAL"` | no |
| <a name="input_image"></a> [image](#input\_image) | Instance Image | `map(any)` | <pre>{<br/>  "family": "debian-13",<br/>  "project": "debian-cloud"<br/>}</pre> | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Instance machine type | `string` | `"f1-micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the instance | `string` | `"instance-1"` | no |
| <a name="input_network"></a> [network](#input\_network) | The name or self\_link of the VPC network to which the instance will be connected. Must not be the default network. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | GCP Project ID | `string` | n/a | yes |
| <a name="input_service_account_scopes"></a> [service\_account\_scopes](#input\_service\_account\_scopes) | OAuth scopes for the instance service account. Defaults to logging and monitoring only. Do not use 'cloud-platform'. | `list(string)` | <pre>[<br/>  "https://www.googleapis.com/auth/logging.write",<br/>  "https://www.googleapis.com/auth/monitoring"<br/>]</pre> | no |
| <a name="input_zone"></a> [zone](#input\_zone) | GCP Zone | `string` | `"us-central1-a"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The unique identifier for the instance. |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The email of the dedicated service account created for the instance. Grant this SA the roles it needs. |
| <a name="output_source_image_id"></a> [source\_image\_id](#output\_source\_image\_id) | The unique identifier for the source image used for the instance's boot disk. |
| <a name="output_source_image_name"></a> [source\_image\_name](#output\_source\_image\_name) | The name of the source image used for the instance's boot disk. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Role and Permissions

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang

resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike-477416"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "compute.addresses.create",
    "compute.addresses.createInternal",
    "compute.addresses.delete",
    "compute.addresses.deleteInternal",
    "compute.addresses.get",
    "compute.addresses.setLabels",
    "compute.disks.create",
    "compute.disks.setLabels",
    "compute.instances.create",
    "compute.instances.delete",
    "compute.instances.get",
    "compute.instances.setLabels",
    "compute.instances.setMetadata",
    "compute.instances.stop",
    "compute.instances.updateNetworkInterface",
    "compute.networks.use",
    "compute.subnetworks.use",
    "compute.subnetworks.useExternalIp",
    "compute.zones.get",
    "iam.serviceAccounts.create",
    "iam.serviceAccounts.delete",
    "iam.serviceAccounts.get",
    "iam.serviceAccounts.update"
  ]
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Information

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-gcp-staticip/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-gcp-staticip/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2026 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
