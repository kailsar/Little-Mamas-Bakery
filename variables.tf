variable "aws_region" {}
variable "aws_profile" {}

variable "deploy_type" {}

variable "vpc_cidrblock" {}

variable "CIDR_divider" {}

variable "availability_zone" {
  type = "map"
}

variable "zones" {
  type = "list"
}

variable "bastion_ami" {}

variable "bastion_instance_type" {}

variable "webserver_ami" {}

variable "webserver_instance_type" {}

variable "appserver_ami" {}

variable "appserver_instance_type" {}

variable "subnet_group_name" {}
