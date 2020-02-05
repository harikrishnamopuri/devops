module "vpc" {
    source  = "git@github.com:harikrishnamopuri/tf-modules//gcp/applications/vpc"
#    version = "~> 2.1"

    project_id   = "axial-radius-249202"
    network_name = "example-vpc"
    routing_mode = "GLOBAL"

    subnets = var.subnets

    secondary_ranges = var.secondary_ranges

    routes = [
        {
            name                   = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        },
    ]
}
