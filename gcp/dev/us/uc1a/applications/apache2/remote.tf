terraform {
  backend "gcs" {
    bucket  = "sri-eu-test"
    prefix  = "terraform/apache2/testhari"
  }
}
