resource "aws_ecs_cluster" "cluster" {
  name = var.app_prefix
  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = merge(var.default_tags, {})
}

resource "aws_iam_role" "role" {
  name = "ecr_ecs_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ecs-tasks.amazonaws.com"
        ]
      }
    }
  ]
}
EOF

  inline_policy {
    name   = "ecr_permissions"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload",
        "ecr:GetDownloadUrlForLayer",
        "ecr:PutImage"
      ],
      "Resource": "*"
    }
  ]
}
EOF
  }

  tags = merge(var.default_tags, {})
}

resource "aws_ecs_task_definition" "task" {
  family                   = "${var.app_prefix}-service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE", "EC2"]
  cpu                      = 256
  memory                   = 1024
  task_role_arn            = aws_iam_role.role.arn
  execution_role_arn       = aws_iam_role.role.arn
  container_definitions    = file("../task_definition.json")

  tags = merge(var.default_tags, {})
}

resource "aws_ecs_service" "service" {
  name             = "${var.app_prefix}-service"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.task.id
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.internal.id]

    subnets = aws_subnet.subnets[*].id
  }

  lifecycle {
    ignore_changes = [task_definition]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = "main_container"
    container_port   = 3000
  }
  tags = merge(var.default_tags, {})
}

resource "aws_ecr_repository" "ecr" {
  name                 = var.app_prefix
  image_tag_mutability = "MUTABLE"
  force_delete         = false

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = merge(var.default_tags, {})
}

resource "aws_lb" "lb" {
  name               = var.app_prefix
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.external.id]
  subnets = aws_subnet.subnets[*].id
  tags = merge(var.default_tags, {})
}

resource "aws_lb_target_group" "tg" {
  name        = "${var.app_prefix}-tg"
  target_type = "ip"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  tags = merge(var.default_tags, {})
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

  tags = merge(var.default_tags, {})
}
