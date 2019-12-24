variable "region" {
  type = string
  default  = "us-west-2"
}

variable "ami" {
  type = string
  default = "ami-a2e544da"
}

variable "ssh_key" {
  type    = string
  default = "hari-test"
}


variable "app_name" {
  type = string
  default  = "apache2"
}

variable "env" {
  type = string
  default = "dev"
}

variable "lb_type" {
   type = string
   default  = "nlb"
}
variable "max_size" {
  type    = string
  default = 2
}

variable "min_size" {
  type    = string
  default = 1
}
variable "desired_capacity" {
  type    = string
  default = 1
}

variable "ebs_type" {
  type    = string
  default = "gp2"
}

variable "ebs_size" {
  type    = string
  default = 30
}

variable "ebs_delete" {
  type    = string
  default = "true"
}

# Instance (autoscaling)

variable "health_check_type" {
  type    = string
  default = "ELB"
}

variable "launch_time" {
  type    = string
  default = 600
}


variable "apache2_ports" {

  default = {
    "inbound" = "9090" 
  }
}

variable "apache2_lb" {
  type   = string
  default = "true"

}


