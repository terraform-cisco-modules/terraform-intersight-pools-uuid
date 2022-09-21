module "uuid_pool" {
  source  = "terraform-cisco-modules/pools-uuid/intersight"
  version = ">= 1.0.1"

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

