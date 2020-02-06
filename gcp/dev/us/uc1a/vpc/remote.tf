terraform {
  backend "gcs" {
    bucket  = "sri-eu-test"
    prefix  = "terraform/vpc"
  }
}
