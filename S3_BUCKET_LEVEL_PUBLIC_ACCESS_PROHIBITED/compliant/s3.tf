resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket-name
  force_destroy = true
}


resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  // changed to private
  acl    = "private"
}

// Added this section
resource "aws_s3_bucket_public_access_block" "bucket-fix" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}