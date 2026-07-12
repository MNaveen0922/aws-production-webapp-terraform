variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_1_id" {
  description = "Public Subnet 1 ID"
  type        = string
}

variable "public_subnet_2_id" {
  description = "Public Subnet 2 ID"
  type        = string
}

variable "alb_security_group_id" {
  description = "Application Load Balancer Security Group ID"
  type        = string
}

variable "web_1_instance_id" {
  description = "Web Server 1 Instance ID"
  type        = string
}

variable "web_2_instance_id" {
  description = "Web Server 2 Instance ID"
  type        = string
}