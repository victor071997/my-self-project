resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  key_name      = var.key_pair_name
  name   = "ec2-security-group"

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
} 

resource "aws_instance" "vm" {
  ami                    = var.ami
  instance_type          = var.type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.sg.id]
  associate_public_ip_address = true
  tags                   = { Name = "Terraform-VM" }
}
