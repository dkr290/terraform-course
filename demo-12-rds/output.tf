output public_ip_address {
    value = "${aws_instance.example.public_ip}"
}

output "rds" {
  value = aws_db_instance.mariadb.endpoint
}
