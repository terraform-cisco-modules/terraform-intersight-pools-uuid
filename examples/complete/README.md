<!-- BEGIN_TF_DOCS -->
# UUID Pool Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

### main.tf
```hcl
module "uuid_pool" {
  source  = "scotttyso/pools-uuid/intersight"
  version = ">= 1.0.2"

  assignment_order = "sequential"
  description      = "defualt UUID Pool"
  uuid_blocks = [
    {
      from = "0000-000000000000"
      size = 1000
    }
  ]
  name         = "default"
  organization = "default"
  prefix       = "000025B5-0000-0000"
}

```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```

### versions.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```
<!-- END_TF_DOCS -->