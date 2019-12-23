resource "aws_s3_bucket" "global_config_bucket" {
  acl    = "private"
  bucket = "sre-config-${var.account}-${var.env}"
  region = "us-east-1"
}
resource "aws_s3_bucket" "global_config_bucket_usw1" {
  acl    = "private"
  bucket = "sre-config-${var.account}--usw1"
  region = "us-east-1"
}
resource "aws_s3_bucket" "global_config_bucket_usw2" {
  acl    = "private"
  bucket = "sre-config-${var.account}-usw2"
  region = "us-east-1"
}
