output "IPv4-1" {
  value = aws_instance.web-1.public_ip
}
output "IPv4-2" {
  value = aws_instance.web-2.public_ip
}
output "IPv4-3" {
  value = aws_instance.web-3.public_ip
}
