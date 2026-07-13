resource "aws_cloudfront_origin_access_control" "this" {

  name = "${var.project_name}-${var.environment}-oac"

  description = "Origin Access Control for S3"

  origin_access_control_origin_type = "s3"

  signing_behavior = "always"

  signing_protocol = "sigv4"

}

resource "aws_cloudfront_distribution" "this" {

  enabled = true

  is_ipv6_enabled = true

  default_root_object = "index.html"

  origin {

    domain_name = var.bucket_regional_domain_name

    origin_id = "s3-origin"

    origin_access_control_id = aws_cloudfront_origin_access_control.this.id

  }

  default_cache_behavior {

    allowed_methods = [
      "GET",
      "HEAD"
    ]

    cached_methods = [
      "GET",
      "HEAD"
    ]

    target_origin_id = "s3-origin"

    viewer_protocol_policy = "redirect-to-https"

    compress = true

    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"

  }

  restrictions {

    geo_restriction {

      restriction_type = "none"

    }

  }

  viewer_certificate {

    cloudfront_default_certificate = true

  }

  price_class = "PriceClass_100"

  tags = {

    Name = "${var.project_name}-${var.environment}-cloudfront"

    Environment = var.environment

    Project = var.project_name

  }

}

data "aws_iam_policy_document" "cloudfront_oac" {

  statement {

    sid = "AllowCloudFrontServicePrincipal"

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${var.bucket_arn}/*"
    ]

    principals {

      type = "Service"

      identifiers = [
        "cloudfront.amazonaws.com"
      ]

    }

    condition {

      test = "StringEquals"

      variable = "AWS:SourceArn"

      values = [
        aws_cloudfront_distribution.this.arn
      ]

    }

  }

}

resource "aws_s3_bucket_policy" "this" {

  bucket = var.bucket_name

  policy = data.aws_iam_policy_document.cloudfront_oac.json

}