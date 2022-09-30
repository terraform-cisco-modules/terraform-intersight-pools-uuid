<!-- BEGIN_TF_DOCS -->
# Terraform Intersight Pools - UUID
Manages Intersight UUID Pools

Location in GUI:
`Pools` » `Create Pool` » `UUID`

## Example

### main.tf
```hcl
module "uuid_pool" {
  source  = "terraform-cisco-modules/pools-uuid/intersight"
  version = ">= 1.0.2"

  assignment_order = "sequential"
  description      = "defualt UUID Pool"
  name             = "default"
  organization     = "default"
  prefix           = "000025B5-0000-0000"
  uuid_blocks = [
    {
      from = "0000-000000000000"
      size = 1000
    }
  ]
}

```

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
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

## Environment Variables

### Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with value of [your-api-key]
- Add variable secretkey with value of [your-secret-file-content]

### Linux
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_secretkey=`cat <secret-key-file-location>`
```

### Windows
```bash
$env:TF_VAR_apikey="<your-api-key>"
$env:TF_VAR_secretkey="<secret-key-file-location>"
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.32 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.32 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_assignment_order"></a> [assignment\_order](#input\_assignment\_order) | Assignment order decides the order in which the next identifier is allocated.<br>  * sequential - Identifiers are assigned in a sequential order.<br>  * default - Assignment order is decided by the system. | `string` | `"default"` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the UUID Pool. | `string` | `""` | no |
| <a name="input_uuid_blocks"></a> [uuid\_blocks](#input\_uuid\_blocks) | List of UUID's Suffix(s), with their Parameters, to Assign to the UUID Pool.<br>  * from - Starting UUID Address.  An Example is "0000-000000000000".<br>  * size - Size of UUID Pool.  An Example is 1000.<br>  * to - Ending UUID Address.  An Example is "0000-0000000003E7".<br>  * IMPORTANT NOTE: You can only Specify `size` or `to` on initial creation.  This is a limitation of the API. | <pre>list(object(<br>    {<br>      from = string<br>      size = optional(number, null)<br>      to   = optional(string, null)<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the UUID Pool. | `string` | `"default"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix to assign to the UUID Pool. | `string` | `"000025B5-0000-0000"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"default"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag Attributes to Assign to the Policy. | `list(map(string))` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | UUID Pool Managed Object ID (moid). |
## Resources

| Name | Type |
|------|------|
| [intersight_uuidpool_pool.uuid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/uuidpool_pool) | resource |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
<!-- END_TF_DOCS -->