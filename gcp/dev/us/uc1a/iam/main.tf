module "service_accounts" {
  source        = "git@github.com:harikrishnamopuri/tf-modules//gcp/resources/serviceaccount"
  project_id    = var.project_id
  prefix        = ""
  names         = ["test-two", "test-one"]
  generate_keys = true

  project_roles = [
    "${var.project_id}=>roles/viewer",
    "${var.project_id}=>roles/storage.objectViewer",
  ]
}
