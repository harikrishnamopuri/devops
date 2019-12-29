terraform {
  backend "s3" {
    bucket         = "sre-techy-dev-global-jyo"
    key            = "terraform/dev/global/global/terraform.tfstate"
    region         = "us-west-2"
    profile        = "dev"
  }
}

