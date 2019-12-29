terraform {
  backend "s3" {
    bucket         = "sre-techy-dev-global-726571541050"
    key            = "terraform/dev/global/global/terraform.tfstate"
    region         = "us-west-2"
    profile        = "dev"
  }
}

