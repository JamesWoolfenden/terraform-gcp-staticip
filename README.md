# terraform-gcp-staticip

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-staticip/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-staticip)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-staticip.svg)](https://github.com/JamesWoolfenden/terraform-gcp-staticip/releases/latest)
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
  common_tags = var.common_tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| common\_tags | This is a map type for applying tags on resources | `map` | n/a | yes |
| image | Instance Image | `map` | <pre>{<br>  "family": "debian-9",<br>  "project": "debian-cloud"<br>}</pre> | no |
| machine\_type | Instance machine type | `string` | `"f1-micro"` | no |
| name | Name of the instance | `string` | `"ipv4-address"` | no |
| zone | GCP Zone | `string` | `"us-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_id | n/a |
| source\_image\_id | n/a |
| source\_image\_name | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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

Copyright © 2019-2021 James Woolfenden

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
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-gcp-staticip&url=https://github.com/JamesWoolfenden/terraform-gcp-staticip
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-gcp-staticip&url=https://github.com/JamesWoolfenden/terraform-gcp-staticip
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-gcp-staticip
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-gcp-staticip
[share_email]: mailto:?subject=terraform-gcp-staticip&body=https://github.com/JamesWoolfenden/terraform-gcp-staticip
