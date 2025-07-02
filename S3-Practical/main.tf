resource "aws_s3_bucket" "create_table" {
  bucket = "my-very-useful-bucket"

  tags = {
    Name        = "My Terraform Bucket"
    Environment = "Dev"
  }

}

resource "aws_s3_bucket_public_access_block" "create_table" {
  bucket = aws_s3_bucket.create_table.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_vpc" "mainvpc" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_default_security_group" "terraform_security_group" {
  vpc_id = aws_vpc.mainvpc.id

  ingress {
    protocol  = "tcp"
    self      = false
    from_port = 80
    to_port   = 80
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/10"]
  }
}