variable "region" {
  default = "us-west-2"
}

variable "code" {
  default = "us"
}

variable "active_region" {
  default = "us-west-2"
}

variable "regions" {
  type    = list(string)
  default = ["us-west-2"]
}

# For VPC Subnets
variable "region_zones" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "vpc_cidr" {
  type = list(string)

  default = [
    "10.20.0.0",
    "10.21.0.0",
    "10.22.0.0",
    "10.23.0.0",
  ]
}

variable "vpn_cidr" {
  default     = "10.250.16.0"
  description = "Subnet users will be placed in when connecting to VPN"
}

variable "vpn_app_cidr" {
  default     = "10.251.16.0"
  description = "Subnet users will be placed in when connecting to VPN"
}

variable "vpc_cidr_map" {
  type = map(string)

  default = {
    hub       = "10.20.0.0/16"
    app       = "10.21.0.0/16"
    partner   = "10.22.0.0/16"
    bixby_crm = "10.23.0.0/16"
  }
}


variable "hub_vpc" {
  type = map(list(string))

  default = {
    db_subnets      = ["10.20.0.0/22", "10.20.4.0/22", "10.20.8.0/22"]
    public_subnets  = ["10.20.255.0/24", "10.20.254.0/24", "10.20.253.0/24"]
    private_subnets = ["10.20.12.0/22", "10.20.16.0/22", "10.20.20.0/22"]
  }
}

variable "partner_vpc" {
  type = map(list(string))

  default = {
    db_subnets      = ["10.22.0.0/22", "10.22.4.0/22", "10.22.8.0/22"]
    public_subnets  = ["10.22.255.0/24", "10.22.254.0/24", "10.22.253.0/24"]
    private_subnets = ["10.22.12.0/22", "10.22.16.0/22", "10.22.20.0/22"]
  }
}

variable "app_vpc" {
  type = map(list(string))

  default = {
    db_subnets      = ["10.21.0.0/22", "10.21.4.0/22", "10.21.8.0/22"]
    public_subnets  = ["10.21.255.0/24", "10.21.254.0/24", "10.21.253.0/24"]
    private_subnets = ["10.21.12.0/22", "10.21.16.0/22", "10.21.20.0/22"]
    vm_subnets      = ["10.21.24.0/22", "10.21.28.0/22", "10.21.32.0/22"]
  }
}

# For Sharing DBs
variable "public_db_subnets" {
  default = ["10.21.250.0/24", "10.21.249.0/24", "10.21.248.0/24"]
}

# For ASR rampcode to deploy
variable "region_rampcodes" {
  type    = list(string)
  default = ["mobile", "speaker", "deploy", "dalcd", "dandp", "nextspk", "sralab1", "sralab2"]
}

