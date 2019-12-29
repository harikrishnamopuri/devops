### Variables ###

variable "account" {
  default = "dev"
}

variable "account_profile" {
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
     dev = "726571541050"
  }
}

variable "region_codes" {
  type = map(string)

  default = {
    cn-north-1     = "cnn1"
    cn-northwest-1 = "cnnw1"
    eu-west-1      = "euw1"
    us-west-2      = "usw2"
    us-east-1      = "use1"
    us-east-2      = "use2"
    ap-northeast-2 = "apne2"
    ap-southeast-1 = "apse1"
  }
}


# deprecated in favor of primary_dns_domain
variable "main_dns_zone" {
  default = "sre.techy.com"
}


data "aws_caller_identity" "current" {
}

# Plugin and Terraform verion file

terraform {
  required_version = ">= 0.12"
}


