module "apache2" {
  source              = "git@github.com:harikrishnamopuri/tf-modules.git//aws/resources/eks"
  eks_cluster_name    = var.eks_cluster_name
  account             = var.account
  account_ids         = var.account_ids
  aws_profile         = var.aws_profile
  region              = var.region
  region_code         = var.region_code
  vpc_zone_identifier = data.aws_subnet.private.*.id
  subnet_ids          = data.aws_subnet.private.*.id
  vpc_id              = data.aws_vpc.hub.id
  worker_names        = local.worker_names
  worker_nodes        = local.worker_nodes
  user_access         = local.user_access
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/DK2E7kV/YfhBqdQ3op0WSdLRxnJjiqQ4HV8Q2V4m0w1f5qLJFpOD0KQFGdzN6ow4YeWWNC7Yv7z51BrEzkhZxd4Fdx3zFaA/R8d4c10vJiUtw4GwoJaedmT1ENSy+NYH3gztyHgTp7a6HEC+TuZAcs9ztSBHNE/iih3sCt1omNCmLpjIj3VaOdWNl+aaXnBNQX411S9bL9VzLoAfLGSGM5Ek/UuSJAoMi1SjiOlfboMNeZaC6tJbqpx5nadoqEzRoFBSSlfY2TjnUEFz6AZo0TTrBBYDF9wdBokkv6HL+Wz5OZDRbkVy5DSk6lPMHI1bRRuLwkNbONCCjvGJadfP root@ip-10-0-2-179"
}

