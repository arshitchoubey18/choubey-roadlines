# Choubey Roadlines - AWS Infrastructure
terraform {
  required_version = ">=1.5"
  required_providers { aws = { source = "hashicorp/aws", version = "~>5.0" } }
}

provider "aws" { region = "ap-south-1" }

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "choubey-vpc"
  cidr = "10.0.0.0/16"
  azs = ["ap-south-1a","ap-south-1b"]
  public_subnets = ["10.0.1.0/24","10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24","10.0.4.0/24"]
  enable_nat_gateway = true
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"
  cluster_name = "choubey-cluster"
  cluster_version = "1.29"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  eks_managed_node_groups = {
    web = { instance_types = ["t3.medium"], min_size=2, max_size=5, desired_size=3 }
  }
}

resource "aws_ecr_repository" "choubey" {
  name = "choubey"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration { scan_on_push = true }
}
