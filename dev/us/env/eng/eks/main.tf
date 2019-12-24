module "eks" {
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

