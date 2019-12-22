module "credstash_use1" {
  source = "git@github.com:harikrishnamopuri/tf-modules.git//aws/resources/credstash"

  account_id = data.aws_caller_identity.current.account_id
  name       = "us-east-1"
  region     = "us-east-1"
  profile    = var.account_profile

  read_capacity       = 20
  enable_key_rotation = true
}
module "credstash_use2" {
  source = "git@github.com:harikrishnamopuri/tf-modules.git//aws/resources/credstash"

  account_id = data.aws_caller_identity.current.account_id
  name       = "us-east-2"
  region     = "us-east-2"
  profile    = var.account_profile

  read_capacity       = 20
  enable_key_rotation = true
}


# consumers will want to iterate over reader ARNs
locals {
  credstash_list = [
    module.credstash_use1.iam_policy_credstash_reader_arn,
    module.credstash_use2.iam_policy_credstash_reader_arn,
  ]
  credstash_write_list = [
    module.credstash_use1.iam_policy_credstash_writer_arn,
    module.credstash_use2.iam_policy_credstash_writer_arn,
  ]
}


