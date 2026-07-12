output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_1_id" {
  value = module.vpc.public_subnet_1_id
}

output "public_subnet_2_id" {
  value = module.vpc.public_subnet_2_id
}

output "private_subnet_1_id" {
  value = module.vpc.private_subnet_1_id
}

output "private_subnet_2_id" {
  value = module.vpc.private_subnet_2_id
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  value = module.vpc.nat_gateway_id
}

output "nat_eip" {
  value = module.vpc.nat_eip
}

output "iam_role_name" {
  value = module.iam.role_name
}

output "iam_role_arn" {
  value = module.iam.role_arn
}

output "instance_profile_name" {
  value = module.iam.instance_profile_name
}

output "alb_security_group_id" {
  value = module.security_group.alb_security_group_id
}

output "ec2_security_group_id" {
  value = module.security_group.ec2_security_group_id
}

output "web_1_instance_id" {
  value = module.ec2.web_1_instance_id
}

output "web_2_instance_id" {
  value = module.ec2.web_2_instance_id
}

output "web_1_private_ip" {
  value = module.ec2.web_1_private_ip
}

output "web_2_private_ip" {
  value = module.ec2.web_2_private_ip
}

output "web_1_private_dns" {
  value = module.ec2.web_1_private_dns
}

output "web_2_private_dns" {
  value = module.ec2.web_2_private_dns
}

output "web_1_availability_zone" {
  value = module.ec2.web_1_availability_zone
}

output "web_2_availability_zone" {
  value = module.ec2.web_2_availability_zone
}