region = "<AWS REGION>"
environment = "<NAME OF THE ENVIRONMENT>"
vpc_id = "<VPC ID>"
private_subnet_ids = [<LIST OF PRIVATE SUBNET IDS>]
public_subnet_ids = [<LIST OF PUBLIC SUBNET IDS>]
secondary_subnet_ids = [<LIST OF SECONDARY PRIVATE SUBNETS>]
key_pair = "<KEY PAIR FOR EC2 WORKERS>"
bastion_host_sg_id = "<BASTION HOST SECURITY GROUP ID FOR WORKERS EC2 SSH ACCESS>"

project = "<NAME OF THE PROJECT>"

cluster_cidr = [<CIDR TO ALLOW EKS ACCESS>]
lb_cidr = [<CIDR TO RESTRICT THE LOAD BALANCER>]
lb_ipv6_cidr = [<CIDR TO RESTRICT THE LOAD BALANCER IPV6>]

ec2_volume_size=<EC2 VOLUME SIZE>
asg_instance_type = "<INSTANCE SIZE>"
asg_ec2_max_count = <NO. OF EC2 MAXIMUM COUNT>
asg_ec2_min_count = <NO OF EC2 MINIMUM COUNT>
asg_ec2_desired_count = <NO OF EC2 DESIRED COUNT>
endpoint_private_access = true      //to allow private access to eks cluster
endpoint_public_access = false      //to allow public access to eks cluster