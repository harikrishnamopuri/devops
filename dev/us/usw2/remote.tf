
terraform {
  backend "s3" {
    acl            = "private"
    bucket         = "sre-techy-config-dev-usw2"
    key            = "terraform/dev/us/usw2/terraform.tfstate"
    region         = "us-west-2"
    profile        = "dev"
    dynamodb_table = "false"
  }
}


