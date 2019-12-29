resource "aws_s3_bucket" "global_config_bucket" {
  acl    = "private"
  bucket = "sre-techy-config-${var.account}-${var.env}-${var.account_ids[var.account_profile]}"
  region = "us-west-2"
}
resource "aws_s3_bucket" "global_config_bucket_usw1" {
  acl    = "private"
  bucket = "sre-techy-config-${var.account}-usw1-${var.account_ids[var.account_profile]}"
  region = "us-west-2"
}
resource "aws_s3_bucket" "global_config_bucket_usw2" {
  acl    = "private"
  bucket = "sre-techy-config-${var.account}-usw2-${var.account_ids[var.account_profile]}"
  region = "us-west-2"
}
