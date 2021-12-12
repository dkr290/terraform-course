output public_ip_address {
    value = "${aws_instance.example.public_ip}"
}

output s3_bucket {
    value = "${aws_s3_bucket.b.tags.Name}"
}