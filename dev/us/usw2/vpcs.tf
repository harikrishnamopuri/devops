module "hub_usw2_vpc" {
   source = "git@github.com:harikrishnamopuri/tf-modules.git//aws/resources/vpc"

  name       = "hub-usw2"
  cidr_block = var.vpc_cidr_map["hub"]
  region     = "us-west-2"
  zones      = var.region_zones
  instance_tenancy = "default"

  private_subnets = var.hub_vpc["private_subnets"]
  public_subnets  = var.hub_vpc["public_subnets"]

  num_peers = 1

  peers = [
    {
      cidr = var.vpc_cidr_map["partner"]
      pcx  = aws_vpc_peering_connection.hub_partner_usw2.id
    },
  ]
}
module "partner_usw2_vpc" {
  source = "git@github.com:harikrishnamopuri/tf-modules.git//aws/resources/vpc"

  name       = "partner-usw2"
  cidr_block = var.vpc_cidr_map["partner"]
  region     = "us-west-2"
  zones      = var.region_zones
  instance_tenancy = "default"

  private_subnets = var.partner_vpc["private_subnets"]
  public_subnets  = var.partner_vpc["public_subnets"]

  num_peers = 0

  peers = [
  ]
}
resource "aws_vpc_peering_connection" "hub_partner_usw2" {
  auto_accept   = true
  peer_owner_id = data.aws_caller_identity.current.account_id
  peer_vpc_id   = module.partner_usw2_vpc.aws_vpc_id
  vpc_id        = module.hub_usw2_vpc.aws_vpc_id
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name      = "hub-partner-usw2"
    env       = "hub"
    terraform = "true"
  }
}
