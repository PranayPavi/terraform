#S3 Bucket Public Access
resource "aws_s3_bucket" "public_bucket" {
  bucket = var.bucket_name
    
  tags {
    Name = var.s3_tags.Name
  }
}
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.public_bucket.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.restrict_public_buckets
  restrict_public_buckets = var.restrict_public_buckets
}
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.public_bucket.id
  versioning_configuration {
    status = var.s3_versioning_status
  }
}