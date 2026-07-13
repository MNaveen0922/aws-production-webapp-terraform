resource "aws_s3_bucket" "this" {

  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Project     = var.project_name
    Environment = var.environment
  }

}

resource "aws_s3_bucket_versioning" "this" {

  bucket = aws_s3_bucket.this.id

  versioning_configuration {

    status = "Enabled"

  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {

  bucket = aws_s3_bucket.this.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}

resource "aws_s3_bucket_public_access_block" "this" {

  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

resource "aws_s3_bucket_ownership_controls" "this" {

  bucket = aws_s3_bucket.this.id

  rule {

    object_ownership = "BucketOwnerPreferred"

  }

}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.this.id
  key          = "index.html"
  source       = "${path.root}/../website/index.html"
  content_type = "text/html"

  etag = filemd5("${path.root}/../website/index.html")
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.this.id
  key          = "error.html"
  source       = "${path.root}/../website/error.html"
  content_type = "text/html"

  etag = filemd5("${path.root}/../website/error.html")
}

resource "aws_s3_object" "style" {
  bucket       = aws_s3_bucket.this.id
  key          = "style.css"
  source       = "${path.root}/../website/style.css"
  content_type = "text/css"

  etag = filemd5("${path.root}/../website/style.css")
}