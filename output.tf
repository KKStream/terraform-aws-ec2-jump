output "instance_id" {
  value = aws_instance.jump.id
}

output "private_ip" {
  value = aws_instance.jump.private_ip
}

output "public_ip" {
  value = aws_eip.public_ip.public_ip
}

output "role_id" {
  value = try(aws_iam_role.jump[0].id, null)
}

output "role_arn" {
  value = try(aws_iam_role.jump[0].arn, null)
}

output "role_name" {
  value = try(aws_iam_role.jump[0].name, null)
}

output "sg_id" {
  value = aws_security_group.jump.id
}