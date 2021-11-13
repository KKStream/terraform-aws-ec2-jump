resource "aws_instance" "jump" {
  ami                     = var.ami
  instance_type           = var.instance_type
  vpc_security_group_ids  = concat([aws_security_group.jump.id], var.additional_security_group_ids)
  subnet_id               = var.subnet_id
  iam_instance_profile    = aws_iam_instance_profile.jump.name
  user_data_base64        = var.user_data_base64
  disable_api_termination = var.termination_protection
  key_name                = var.key_name

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.root_volume_size
    delete_on_termination = true
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  tags = merge({
    Name        = "${var.project_name}-${local.environment}-ec2-jump"
    Environment = "${var.project_name}-${local.environment}"
  }, var.tags)

  volume_tags = merge({
    Name        = "${var.project_name}-${local.environment}-vol-jump"
    Environment = "${var.project_name}-${local.environment}"
  }, var.volume_tags)
}

resource "aws_eip" "public_ip" {
  vpc = true

  tags = {
    Name        = "${var.project_name}-${local.environment}-eip-jump"
    Environment = "${var.project_name}-${local.environment}"
  }
}

resource "aws_eip_association" "server" {
  instance_id         = aws_instance.jump.id
  allocation_id       = aws_eip.public_ip.id
  allow_reassociation = true
}
