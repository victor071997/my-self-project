output "public_ip" {
  description = "The ephemeral public IP of the instance"
  value       = aws_instance.web.public_ip
}

