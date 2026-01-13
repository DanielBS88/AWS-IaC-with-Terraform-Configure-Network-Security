output "ssh_security_group_id" {
  description = "ID do Security Group SSH"
  value       = aws_security_group.ssh_sg.id
}

output "public_http_security_group_id" {
  description = "ID do Security Group HTTP Público"
  value       = aws_security_group.public_http_sg.id
}

output "private_http_security_group_id" {
  description = "ID do Security Group HTTP Privado"
  value       = aws_security_group.private_http_sg.id
}
