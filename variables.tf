#____________________________________________________________
#
# UUID Pool Variables Section.
#____________________________________________________________

variable "assignment_order" {
  default     = "default"
  description = <<-EOT
  Assignment order decides the order in which the next identifier is allocated.
    * sequential - Identifiers are assigned in a sequential order.
    * default - Assignment order is decided by the system.
  EOT
  type        = string
}

variable "description" {
  default     = ""
  description = "Description for the UUID Pool."
  type        = string
}

variable "uuid_blocks" {
  default     = []
  description = <<-EOT
  List of UUID's Suffix(s), with their Parameters, to Assign to the UUID Pool.
    * from - Starting UUID Address.  An Example is "0000-000000000000".
    * size - Size of UUID Pool.  An Example is 1000.
    * to - Ending UUID Address.  An Example is "0000-0000000003E7".
    * IMPORTANT NOTE: You can only Specify `size` or `to` on initial creation.  This is a limitation of the API.
  EOT
  type = list(object(
    {
      from = string
      size = optional(number, null)
      to   = optional(string, null)
    }
  ))
}

variable "name" {
  default     = "default"
  description = "Name for the UUID Pool."
  type        = string
}

variable "prefix" {
  default     = "000025B5-0000-0000"
  description = "Prefix to assign to the UUID Pool."
  type        = string
}

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = string
}

variable "tags" {
  default     = []
  description = "List of Tag Attributes to Assign to the Policy."
  type        = list(map(string))
}
