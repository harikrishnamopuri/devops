# tf/global outputs

# Used for peering VPCs etc.
output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

# Deprecated: This map name is ambiguous. use dns_zone_id_map
# As of tf 0.8.5, don't try to use periods or dots in key names!
output "dns_zone_map" {
  value = {
    "bixby_main"       = aws_route53_zone.main_dns_zone.id
  }
}

output "ca_arn" {
  value = {
    "region"     = "us-west-2"
    "id"         = aws_acmpca_certificate_authority.dev_ca.id
    "arn"        = aws_acmpca_certificate_authority.dev_ca.arn
    "cert"       = aws_acmpca_certificate_authority.dev_ca.certificate
    "cert_chain" = aws_acmpca_certificate_authority.dev_ca.certificate_chain
  }
}

# NOTE:  Don't use `main`  or `bixby_primary` for new services, use `primary`.
output "dns_zone_id_map" {
  value = {
    "bixby_main"       = aws_route53_zone.main_dns_zone.id             # (b2.sixfivelabs.com)
  }
}

output "main_dns_zone_name" {
  value = var.main_dns_zone
}

# Deprecated: This name is confusing & ambiguous. Left it here for legacy reasons.
# Code should be refactored to use main_dns_zone_name
output "main_dns_zone" {
  value = var.main_dns_zone
}


output "s3_config_bucket_map" {
  value = {
    global           = "sre-config-${var.account}-${var.env}-${var.account_ids[var.account_profile]}"
    usw2             = "sre-config-${var.account}-usw2-${var.account_ids[var.account_profile]}"
    usw1             = "sre-config-${var.account}-usw1-${var.account_ids[var.account_profile]}"
  }
}

output "credstash_list" {
  value = local.credstash_list
}

output "credstash_write_list" {
  value = local.credstash_write_list
}

output "credstash_iam_arns" {
  value = {
    us-east-1      = module.credstash_use1.iam_policy_credstash_reader_arn
    us-east-2      = module.credstash_use2.iam_policy_credstash_reader_arn
  }
}

output "credstash_table_arn" {
  value = {
    us-east-1  = module.credstash_use1.table_arn
    us-east-2  = module.credstash_use2.table_arn
  }
}

output "credstash_key_arn" {
  value = {
    us-east-1 = module.credstash_use1.key_arn
    us-east-2      = module.credstash_use2.key_arn
  }
}
