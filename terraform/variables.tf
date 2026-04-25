variable "region" {}
variable "r_vpc_cidr" {}
variable "r_pub_cidr" {}
variable "r_priv_cidr" {}
variable "r_ami" {}
variable "r_type" {}
variable "r_ssh_port" {}
variable "r_allowed_ip" { type = list(string) }
variable "r_bucket_name" {}
