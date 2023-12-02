resource "aws_security_group" "external" {
  name        = "external_sg"
  vpc_id      = aws_vpc.main.id
  description = "Inbound traffic 80 from anywhere"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    self        = "false"
    cidr_blocks = ["0.0.0.0/0"]
    description = "http"
  }

  /*ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    self        = "false"
    cidr_blocks = ["0.0.0.0/0"]
    description = "http"
  }
  */

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.default_tags, {})
}

resource "aws_security_group" "internal" {
  name        = "internal_sg"
  vpc_id      = aws_vpc.main.id
  description = "Container SG from ALB-SG"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.external.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.default_tags, {})
}