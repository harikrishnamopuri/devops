provider "google" {
  version = "~> 2.18.0"
}

module "cloud_storage" {
  source             = "git@github.com:harikrishnamopuri/tf-modules//gcp/resources/storage"
  project_id         = var.project_id
  prefix             = var.prefix
  names              = var.names
  bucket_policy_only = var.bucket_policy_only

  lifecycle_rules = [{
    action = {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }
    condition = {
      age                   = "10"
      matches_storage_class = "MULTI_REGIONAL,STANDARD,DURABLE_REDUCED_AVAILABILITY"
    }
  }]
}
