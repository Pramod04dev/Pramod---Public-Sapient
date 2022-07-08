variable "common_tags" {
  description = "Common tags to apply to all resources"
  type = "map"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "environment" {
  description = "The name of the environmentironment"
}

variable "project" {
  description = "The name of the project"
}

variable "lb_cidr" {
  description = "lb cidr block"
  type = "list"
}

variable "cluster_cidr" {
  type = "list"
}

variable "cluster_name" {
  description = "EKS cluster name"
}

variable "lb_ipv6_cidr" {
  description = "lb ipv6 cidr block"
  type = "list"
}

variable "eks_cluster_nodes_sg_ids" {
  description = "EKS Nodes secuirty group IDs"
}