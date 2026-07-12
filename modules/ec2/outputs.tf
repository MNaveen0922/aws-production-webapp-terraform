output "web_1_instance_id" {
  description = "EC2 Instance 1 ID"
  value       = aws_instance.web_1.id
}

output "web_2_instance_id" {
  description = "EC2 Instance 2 ID"
  value       = aws_instance.web_2.id
}


output "web_1_private_ip" {
  description = "Private IP of EC2 Instance 1"
  value       = aws_instance.web_1.private_ip
}

output "web_2_private_ip" {
  description = "Private IP of EC2 Instance 2"
  value       = aws_instance.web_2.private_ip
}


output "web_1_private_dns" {
  description = "Private DNS of EC2 Instance 1"
  value       = aws_instance.web_1.private_dns
}

output "web_2_private_dns" {
  description = "Private DNS of EC2 Instance 2"
  value       = aws_instance.web_2.private_dns
}


output "web_1_availability_zone" {
  description = "Availability Zone of EC2 Instance 1"
  value       = aws_instance.web_1.availability_zone
}

output "web_2_availability_zone" {
  description = "Availability Zone of EC2 Instance 2"
  value       = aws_instance.web_2.availability_zone
}