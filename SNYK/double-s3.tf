resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket-name
  force_destroy = true
}


resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket" "bucket2" {
  bucket        = var.bucket-name
  force_destroy = true
}


resource "aws_s3_bucket_acl" "bucket_acl2" {
  bucket = aws_s3_bucket.bucket2.id
  acl    = "public-read"
}
