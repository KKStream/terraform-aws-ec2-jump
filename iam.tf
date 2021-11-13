resource "aws_iam_role" "jump" {
  count = length(var.custom_role_name) == 0 ? 1 : 0
  name  = "${var.project_name}-${local.environment}-jump"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF

  tags = {
    Environment = "${var.project_name}-${local.environment}"
    Name        = "${var.project_name}-${local.environment}-role-jump"
  }
}

resource "aws_iam_instance_profile" "jump" {
  name = "${var.project_name}-${local.environment}-jump"
  role = length(var.custom_role_name) > 0 ? var.custom_role_name : aws_iam_role.jump[0].name
}
