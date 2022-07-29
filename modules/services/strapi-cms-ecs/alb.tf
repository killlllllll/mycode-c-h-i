resource "aws_alb" "main" {
  name            = var.alb_name
  subnets         = aws_subnet.public.*.id
  security_groups = [aws_security_group.lb.id]
}

resource "aws_alb_target_group" "app" {
  name        = var.tg_name
  port        = var.alb_port
  protocol    = var.alb_protocol
  vpc_id      = aws_vpc.main.id
  target_type = var.albtarget_targettype

  health_check {
    healthy_threshold   = var.alb_health
    interval            = var.alb_interval
    protocol            = var.healthcheck_protocol
    matcher             = var.alb_matcher
    timeout             = var.alb_timeout
    path                = var.health_check_path
    unhealthy_threshold = var.alb_unhealthy
  }
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.main.id
  port              = var.app_port
  protocol          = var.healthcheck_protocol

  default_action {
    target_group_arn = aws_alb_target_group.app.id
    type             = var.alblistner_frontend
  }
}