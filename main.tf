terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">=1.3.7"
}


provider "aws" {
  region = var.aws_region[1]
}

module "vpc" {
  for_each = var.vpcs
  source   = "terraform-aws-modules/vpc/aws"
  version  = "5.8.1"

  name                    = each.key
  cidr                    = each.value.cidr
  azs                     = each.value.azs
  private_subnets         = each.value.private_subnets
  public_subnets          = each.value.public_subnets
  map_public_ip_on_launch = true
  enable_vpn_gateway      = false
  enable_dns_hostnames    = true
  enable_dns_support      = true
  manage_default_network_acl = false
  manage_default_security_group = false
}
