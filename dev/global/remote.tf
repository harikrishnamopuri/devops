terraform {
  backend "s3" {
    bucket         = "sre-techy-dev-global"
    key            = "terraform/dev/global/global/terraform.tfstate"
    region         = "us-east-1"
    profile        = "dev"
    dynamodb_table = "tf-state-lock-global"
  }
}

