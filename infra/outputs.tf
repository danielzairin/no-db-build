output "server_public_ip" {
  value = aws_instance.instance.public_ip
}

output "server_private_key" {
  value     = tls_private_key.private_key.private_key_pem
  sensitive = true
}
