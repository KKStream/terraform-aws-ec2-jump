# terraform-aws-ec2-jump

Create a jump instance in VPC


## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >= 3.20 |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_security\_group\_ids | n/a | `list(string)` | `[]` | no |
| allow\_ssh\_access\_cidrs | cidr blocks allowed to access bastion host | `list(string)` | n/a | yes |
| ami | AMI ID | `string` | n/a | yes |
| custom\_role\_name | name of the iam role that the bastion host adopts | `string` | `""` | no |
| environment | Development environment | `string` | `""` | no |
| enabled\_egress\_allow\_all | set true if KKS SRE needs to access the bastion hosts by session manager | `bool` | `false` | no |
| enabled\_egress\_allow\_http | allow all egress from tcp port 80 | `bool` | `false` | no |
| enabled\_egress\_allow\_https | allow all egress from tcp port 443 | `bool` | `false` | no |
| enabled\_egress\_allow\_ntp | allow all egress from udp 123 | `bool` | `false` | no |
| instance\_type | n/a | `string` | n/a | yes |
| key\_name | n/a | `string` | `""` | no |
| project\_name | n/a | `string` | n/a | yes |
| root\_volume\_size | n/a | `number` | `10` | no |
| subnet\_id | n/a | `string` | n/a | yes |
| tags | aws tag for ec2 instance | `map(string)` | `{}` | no |
| termination\_protection | n/a | `bool` | `true` | no |
| user\_data\_base64 | n/a | `string` | `""` | no |
| volume\_tags | aws tag for ec2 volume | `map(string)` | `{}` | no |
| vpc\_id | n/a | `string` | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| iam\_role\_id | n/a |
| instance\_id | n/a |
| private\_ip | n/a |
| public\_ip | n/a |
| sg\_id | n/a |


## Example
```
module "bastion_host" {
  source                   = "git::https://github.com/kkstream/terraform-aws-ec2-jump"
  enabled                  = true
  project_name             = "test"
  vpc_id                   = aws_vpc.main.id
  ami                      = "ami-045bb062acf53b1be"
  instance_type            = "t3.micro"
  subnet_id                = "s-123456"
  allow_ssh_access_cidrs   = ["0.0.0.0/0"]
  termination_protection   = true
  key_name                 = "test-key"
  root_volume_size         = 30
  enabled_egress_allow_all = true
}
```
