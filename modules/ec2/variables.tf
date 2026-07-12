variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}


variable "private_subnet_1_id" {
  description = "Private Subnet 1 ID"
  type        = string
}

variable "private_subnet_2_id" {
  description = "Private Subnet 2 ID"
  type        = string
}


variable "security_group_id" {
  description = "EC2 Security Group ID"
  type        = string
}


variable "instance_profile_name" {
  description = "IAM Instance Profile Name"
  type        = string
}



variable "ami_id" {
  description = "Amazon Machine Image (AMI) ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair Name"
  type        = string
}