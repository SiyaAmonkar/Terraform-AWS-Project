output "public-ip-address" {
  value = aws_instance.web_server.public_ip
}
