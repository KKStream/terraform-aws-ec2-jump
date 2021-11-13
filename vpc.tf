resource "aws_security_group" "jump" {
  name        = "${var.project_name}-${local.environment}-jump"
  description = "For jump server"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-${local.environment}-sg-jump"
    Environment = "${var.project_name}-${local.environment}"
  }
}

resource "aws_security_group_rule" "jump_allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.allow_ssh_access_cidrs
  security_group_id = aws_security_group.jump.id
}

resource "aws_security_group_rule" "allow_all" {
  count             = var.enabled_egress_allow_all ? 1 : 0
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jump.id
}

resource "aws_security_group_rule" "jump_egress_allow_http" {
  count             = var.enabled_egress_allow_http ? 1 : 0
  type              = "egress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jump.id
}

resource "aws_security_group_rule" "jump_egress_allow_https" {
  count             = var.enabled_egress_allow_https ? 1 : 0
  type              = "egress"
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jump.id
}

resource "aws_security_group_rule" "jump_egress_allow_ntp" {
  count             = var.enabled_egress_allow_ntp ? 1 : 0
  type              = "egress"
  from_port         = "123"
  to_port           = "123"
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jump.id
}
