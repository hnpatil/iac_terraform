locals {
    cluster_name = "${var.environment}-cluster"
}

module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "19.21.0"

    cluster_name    = "${local.cluster_name}"
    cluster_version = "1.27"
    subnet_ids      = module.vpc.private_subnets

    cluster_endpoint_public_access  = true

    cluster_addons = {
        coredns = {
            most_recent = true
        }
        kube-proxy = {
            most_recent = true
        }
        vpc-cni = {
            most_recent = true
        }
    }

    vpc_id = module.vpc.vpc_id

    eks_managed_node_groups = {
        first = {
            desired_capacity = 1
            max_capacity     = 3
            min_capacity     = 1

            instance_type = "t2.medium"
        }
    }

    tags = {
        Terraform = "true"
        Environment = var.environment
    }
}