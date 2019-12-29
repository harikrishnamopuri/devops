variable "account" {
  default = "dev"
}

variable "aws_profile" {
  default = "dev"
}


variable "accounts" {
  type = map(string)

  default = {
    cn-north-1     = "dev"
    cn-northwest-1 = "dev"
    us-west-2      = "dev"
    us-east-2      = "dev"
    us-east-1      = "dev"
    eu-west-1      = "dev"
    ap-southeast-1 = "dev"
  }
}

variable "account_ids" {
  type = map(string)

  default = {
     dev = "985635016868"
  }
}


#############################

variable "region" {
  default = "us-west-2"
}

variable "region_code" {
  default = "usw2"
}
variable "eks_cluster_name" {
  type    = string
  default = "apache2-int-default"
}
locals {

  worker_names = [ "apache2" ]
  worker_nodes = list(
    map("name", "apache2",
      "ami_id", "ami-015f9b58b66d20c7b",
      "instance_type", "c5.xlarge",
      "min_size", 0,
      "max_size", 2,
      "desired_size", 1,
      "volume_type", "gp2",
      "volume_size", "100",
      "delete_on_termination", "true",
      "key_name", "deployer-key",
    ),
    map("name", "nginx",
      "instance_type", "p2.xlarge",
      "ami_id", "ami-05d586e6f773f6abf",
      "min_size", 0,
      "max_size", 2,
      "desired_size", 0,
      "volume_type", "gp2",
      "volume_size", "100",
      "delete_on_termination", "true",
      "key_name", "deployer-key",
    ),
  )

user_access  = [
 {
   name = "hari.mopuri@gmail.com"
   arn = "arn:aws:iam::717627950615:user/hari.mopuri@samsung.com"
   group = "system:masters"
 },
 {
   name = "DevSpinnakerManagingAccount"
   arn = "arn:aws:iam::985635016868:user/DevSpinnakerManagingAccount"
   group = "system:masters"
 },


]
}

