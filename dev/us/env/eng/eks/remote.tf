terraform {
  backend "s3" {
    bucket         = "sre-config-dev-usw2"
    key            = "terraform/dev/usw2/eks-apache2/terraform.tfstate"
    region         = "us-west-2"
    profile        = "dev"
    dynamodb_table = "tf-state-lock-global"
  }
}
data "terraform_remote_state" "global"  {
  backend = "s3"
  config = {
    bucket = "sre-techy-dev-global"
    key    = "terraform/dev/global/global/terraform.tfstate"
    region = "us-east-1"
  }
}
data "terraform_remote_state" "usw2"  {
  backend = "s3"
  config = {
    bucket = "sre-config-dev-usw2"
    key    = "terraform/dev/us/usw2/terraform.tfstate"
    region = "us-west-2"
  }
}
data "aws_vpc" "hub" {
  id = data.terraform_remote_state.usw2.outputs.vpcs["hub"]
}

data "aws_subnet" "private" {
  count = length(
    data.terraform_remote_state.usw2.outputs.private_subnets[data.aws_vpc.hub.id],
  )
  id = element(
    data.terraform_remote_state.usw2.outputs.private_subnets[data.aws_vpc.hub.id],
    count.index,
  )
}

data "aws_subnet" "public" {
  count = length(
    data.terraform_remote_state.usw2.outputs.public_subnets[data.aws_vpc.hub.id],
  )
  id = element(
    data.terraform_remote_state.usw2.outputs.public_subnets[data.aws_vpc.hub.id],
    count.index,
  )
}


