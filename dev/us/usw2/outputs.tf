
output "private_route_tables" {
  value = {
    "${module.hub_usw2_vpc.aws_vpc_id}"      = module.hub_usw2_vpc.private_route_tables
    "${module.partner_usw2_vpc.aws_vpc_id}"  = module.partner_usw2_vpc.private_route_tables
  }
}

output "private_subnets" {
  value = {
    "${module.hub_usw2_vpc.aws_vpc_id}"      = module.hub_usw2_vpc.private_subnets
    "${module.partner_usw2_vpc.aws_vpc_id}"  = module.partner_usw2_vpc.private_subnets
  }
}

output "public_route_tables" {
  value = {
    "${module.hub_usw2_vpc.aws_vpc_id}"      = module.hub_usw2_vpc.public_route_table
    "${module.partner_usw2_vpc.aws_vpc_id}"  = module.partner_usw2_vpc.public_route_table
  }
}

output "public_subnets" {
  value = {
    "${module.hub_usw2_vpc.aws_vpc_id}"      = module.hub_usw2_vpc.public_subnets
    "${module.partner_usw2_vpc.aws_vpc_id}"  = module.partner_usw2_vpc.public_subnets
  }
}

output "vpcs" {
  value = {
    "hub"       = module.hub_usw2_vpc.aws_vpc_id
    "partner"   = module.partner_usw2_vpc.aws_vpc_id
  }
}

output "vpc_cidrs" {
  value = {
    "hub"       = var.vpc_cidr_map["hub"]
    "partner"   = var.vpc_cidr_map["partner"]
  }
}

output "vpc_cidr_list" {
  value = var.vpc_cidr
}

output "vpc_nat_eips" {
  value = {
    "hub"     = module.hub_usw2_vpc.nat_eips
    "partner" = module.partner_usw2_vpc.nat_eips
  }
}
