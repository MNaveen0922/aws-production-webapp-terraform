resource "aws_instance" "web_1" {

  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_1_id
  vpc_security_group_ids      = [var.security_group_id]
  iam_instance_profile        = var.instance_profile_name
  key_name                    = var.key_name
  associate_public_ip_address = false

  user_data = file("${path.root}/../userdata/install_nginx.sh")

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
    encrypted   = true

    tags = {
      Name = "${var.project_name}-${var.environment}-web1-root-volume"
    }
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-web-1"
    Environment = var.environment
    Project     = var.project_name
  }

}



resource "aws_instance" "web_2" {

  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_2_id
  vpc_security_group_ids      = [var.security_group_id]
  iam_instance_profile        = var.instance_profile_name
  key_name                    = var.key_name
  associate_public_ip_address = false

  user_data = file("${path.root}/../userdata/install_nginx.sh")

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
    encrypted   = true

    tags = {
      Name = "${var.project_name}-${var.environment}-web2-root-volume"
    }
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-web-2"
    Environment = var.environment
    Project     = var.project_name
  }

}