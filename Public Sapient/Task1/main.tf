terraform {
  backend "s3" {}
}

provider "aws" {
  region = "${var.region}"
}

locals {
  # Common tags to be assigned to all resources
  cluster_name = "${var.project}-eks-${var.environment}"
  common_tags = {
    Project = "${var.project}"
    Environment = "${var.environment}"
    CreatedBy = "Terraform"
  }
}

module "Security" {
  source = "./modules/security"
  cluster_name = "${local.cluster_name}"
  environment = "${var.environment}"
  vpc_id = "${var.vpc_id}"
  cluster_cidr = "${var.cluster_cidr}"
  project = "${var.project}"
  common_tags = "${local.common_tags}"
  eks_cluster_nodes_sg_ids = [module.EKS.eks_cluster_sg_id]
  lb_cidr = "${var.lb_cidr}"
  lb_ipv6_cidr = "${var.lb_ipv6_cidr}"
}

module "EKS" {
  source = "./modules/eks-master"
  region = "${var.region}"
  public_subnet_ids = "${var.public_subnet_ids}"
  cluster_name = "${local.cluster_name}"
  eks_cluster_sg_id = "${module.Security.eks_cluster_sg_id}"
  eks_cluster_role_arn = "${module.Security.eks_cluster_role_arn}"
  private_subnet_ids = "${var.private_subnet_ids}"
  secondary_subnet_ids = "${var.secondary_subnet_ids}"
  endpoint_private_access = "${var.endpoint_private_access}"
  endpoint_public_access = "${var.endpoint_public_access}"
  common_tags = "${local.common_tags}"
}

module "EKS-Nodegroup" {
  source = "./modules/eks-workernode"
  region = "${var.region}"
  cluster_name = "${module.EKS.eks_cluster_name}"
  eks_nodegroup_name = "${local.cluster_name}-node-group"
  public_subnet_ids = "${var.public_subnet_ids}"
  private_subnet_ids = "${var.private_subnet_ids}"
  eks_cluster_nodes_role_arn = "${module.Security.eks_cluster_nodes_role_arn}"
  eks_cluster_nodes_remote_access_sg_ids = ["${var.bastion_host_sg_id}"]
  nodes_min_count = "${var.asg_ec2_min_count}"
  nodes_max_count = "${var.asg_ec2_max_count}"
  nodes_desired_count = "${var.asg_ec2_desired_count}"
  nodes_instance_types = ["${var.asg_instance_type}"]
  node_disk_size = "${var.ec2_volume_size}"
  node_key_pair = "${var.key_pair}"
  common_tags = "${local.common_tags}"
}