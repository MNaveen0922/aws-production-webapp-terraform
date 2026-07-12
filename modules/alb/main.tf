resource "aws_lb" "this" {

  name               = "${var.project_name}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    var.alb_security_group_id
  ]

  subnets = [
    var.public_subnet_1_id,
    var.public_subnet_2_id
  ]

  enable_deletion_protection = false

  idle_timeout = 60

  tags = {
    Name        = "${var.project_name}-${var.environment}-alb"
    Environment = var.environment
    Project     = var.project_name
  }

}

resource "aws_lb_target_group" "this" {

  name = "${var.project_name}-tg"

  port = 80

  protocol = "HTTP"

  target_type = "instance"

  vpc_id = var.vpc_id

  health_check {

    enabled = true

    path = "/"

    protocol = "HTTP"

    matcher = "200"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2

  }

  tags = {

    Name = "${var.project_name}-${var.environment}-tg"

    Environment = var.environment

    Project = var.project_name

  }

}

resource "aws_lb_target_group_attachment" "web1" {

  target_group_arn = aws_lb_target_group.this.arn

  target_id = var.web_1_instance_id

  port = 80

}

resource "aws_lb_target_group_attachment" "web2" {

  target_group_arn = aws_lb_target_group.this.arn

  target_id = var.web_2_instance_id

  port = 80

}

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.this.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.this.arn

  }

}