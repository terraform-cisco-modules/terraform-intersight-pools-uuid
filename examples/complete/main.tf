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

