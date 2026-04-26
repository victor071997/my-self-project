variable "vpc_id" {}
variable "subnet_id" {}
variable "ami" {}
variable "type" {}
variable "ssh_port" {}
variable "allowed_ip" { type = list(string) }
