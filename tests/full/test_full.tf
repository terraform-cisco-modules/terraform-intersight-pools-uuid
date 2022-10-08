module "main" {
  source           = "../.."
  assignment_order = "sequential"
  description      = "${var.name} UUID Pool."
  prefix           = "000025B5-0000-0000"
  uuid_blocks = [
    {
      from = "0000-000000000000"
      size = 1000
    }
  ]
  name         = var.name
  organization = "terratest"
}
