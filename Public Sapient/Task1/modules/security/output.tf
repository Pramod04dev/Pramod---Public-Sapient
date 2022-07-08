output "eks_cluster_role_arn"{
  value = "${aws_iam_role.eks_cluster_role.arn}"
}

output "eks_cluster_sg_id" {
  value = "${aws_security_group.eks_cluster_sg.id}"
}

output "eks_cluster_nodes_role_arn" {
  value = "${aws_iam_role.eks_cluster_nodes_role.arn}"
}

output "elasticache_securitygroup_id" {
  value = "${aws_security_group.elasticache_securitygroup.id}"
}

output "eks_lb_sg_id" {
  value = "${aws_security_group.eks_cluster_service_elb_sg.id}"
}