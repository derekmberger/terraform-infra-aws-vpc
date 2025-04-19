locals {
  public_cidr_by_az = { for cidr, az in var.public_subnet_cidrs : az => cidr }
  first_public_cidr = keys(var.public_subnet_cidrs)[0]
  az_list           = distinct(values(var.public_subnet_cidrs))
  az_suffix_map = {
    for idx, az in local.az_list :
    az => element(["a", "b", "c", "d", "e"], idx)
  }
}
