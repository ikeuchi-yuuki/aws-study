# ALB本体
resource "aws_lb" "alb" {
  name               = "${var.my_env}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets = var.public_subnet_ids
  tags = {
    Name = "${var.my_env}-alb"
  }
}

# ターゲットグループ
resource "aws_lb_target_group" "alb_tg" {
  name        = "${var.my_env}-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
  health_check {
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }
  tags = {
    Name = "${var.my_env}-tg"
  }
}

# ALBリスナー
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

# ターゲットグループへのEC2インスタンス登録
resource "aws_lb_target_group_attachment" "ec2_attach" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = var.ec2_instance_id
  port             = 8080
}
