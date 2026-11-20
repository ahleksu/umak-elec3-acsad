provider "aws" {
  region = "ap-southeast-1"
}

# The Lab 4 messages table
resource "aws_dynamodb_table" "messages" {
  name         = "umak-elec3-acsad-g05-messages"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    course = "elec3"
    group  = "acsad-g05"
  }
}

# The Seatwork 3 site bucket
resource "aws_s3_bucket" "site" {
  bucket = "umak-elec3-acsad-g05-linktree"

  tags = {
    course = "elec3"
    group  = "acsad-g05"
  }
}

# Static website hosting with index.html
resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.id

  index_document {
    suffix = "index.html"
  }
}

# Block all public access is cleared
resource "aws_s3_bucket_public_access_block" "site" {
  bucket = aws_s3_bucket.site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Public read of the objects only (s3:GetObject)
resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.site.arn}/*"
      }
    ]
  })

  # S3 refuses a public policy while Block Public Access is on
  depends_on = [aws_s3_bucket_public_access_block.site]
}
