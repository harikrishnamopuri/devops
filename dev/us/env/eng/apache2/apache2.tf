module "apache2" {
  source = "git@github.com:harikrishnamopuri/tf-modules.git//aws/applications/apache2"
  region = var.region
  app_name = var.app_name
  vpc_id = data.aws_vpc.hub.id
  private_subnets = data.aws_subnet.private.*.id
  ami = var.ami
  env = var.env
  max_size = var.max_size
  min_size = var.min_size
  desired_capacity = var.desired_capacity
  ebs_type = var.ebs_type
  ebs_size = var.ebs_size
  ebs_delete = var.ebs_delete
  health_check_type = var.health_check_type
  ssh_key = aws_key_pair.deployer.key_name


  lb_type         = var.lb_type
  apache2_lb      = var.apache2_lb
  apache2_ports      = var.apache2_ports
  }
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/DK2E7kV/YfhBqdQ3op0WSdLRxnJjiqQ4HV8Q2V4m0w1f5qLJFpOD0KQFGdzN6ow4YeWWNC7Yv7z51BrEzkhZxd4Fdx3zFaA/R8d4c10vJiUtw4GwoJaedmT1ENSy+NYH3gztyHgTp7a6HEC+TuZAcs9ztSBHNE/iih3sCt1omNCmLpjIj3VaOdWNl+aaXnBNQX411S9bL9VzLoAfLGSGM5Ek/UuSJAoMi1SjiOlfboMNeZaC6tJbqpx5nadoqEzRoFBSSlfY2TjnUEFz6AZo0TTrBBYDF9wdBokkv6HL+Wz5OZDRbkVy5DSk6lPMHI1bRRuLwkNbONCCjvGJadfP root@ip-10-0-2-179"
}
