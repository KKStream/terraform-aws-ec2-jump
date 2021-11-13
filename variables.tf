variable "project_name" {
  type = string
}

variable "environment" {
  type    = string
  default = ""
}

variable "vpc_id" {
  type = string
}

variable "ami" {
  type        = string
  description = "AMI ID"
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "additional_security_group_ids" {
  type        = list(string)
  default     = []
  description = "Security groups wants to attach on the instance."
}

variable "user_data_base64" {
  type    = string
  default = ""
}

variable "termination_protection" {
  type    = bool
  default = true
}

variable "key_name" {
  type    = string
  default = ""
}

variable "root_volume_size" {
  type    = number
  default = 10
}

variable "custom_role_name" {
  type        = string
  default     = ""
  description = "name of the iam role that the bastion host adopts"
}

variable "allow_ssh_access_cidrs" {
  type        = list(string)
  description = "cidr blocks allowed to access bastion host"
}

variable "enabled_egress_allow_all" {
  type        = bool
  default     = false
  description = "set true if KKS SRE needs to access the bastion hosts by session manager"
}

variable "enabled_egress_allow_http" {
  type        = bool
  default     = false
  description = "allow all egress from tcp port 80"
}

variable "enabled_egress_allow_https" {
  type        = bool
  default     = false
  description = "allow all egress from tcp port 443"
}

variable "enabled_egress_allow_ntp" {
  type        = bool
  default     = false
  description = "allow all egress from udp 123"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "aws tag for ec2 instance"
}

variable "volume_tags" {
  type        = map(string)
  default     = {}
  description = "aws tag for ec2 volume"
}
