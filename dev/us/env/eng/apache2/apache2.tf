module "apache2" {
  source = "git@github.com:harikrishnamopuri/tf-modules.git//aws/applications/apache2"
  region = var.region
  app_name = var.app_name
  vpc_id = data.aws_vpc.hub.id
  private_subnets = data.aws_subnet.private.*.id
  ami = var.ami
  env = var.env
  ansible_role = var.ansible_role
  role_name  = var.role_name
  lb_type         = var.lb_type 
  }
