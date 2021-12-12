resource "aws_s3_bucket" "b" {
  bucket = var.s3_bucket
  acl    = "private"

  tags = {
    Name = var.s3_bucket
  }
}

