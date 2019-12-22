resource "aws_s3_bucket" "global_config_bucket" {
  acl    = "private"
  bucket = "sre-config-${var.account}-${var.env}"
  region = "us-east-1"
}

