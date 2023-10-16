# Configure the AWS Provider
provider "aws" {
  region = var.region
}

#create the aws s3 bucket
resource "aws_s3_bucket" "snake-xenzia-bucket" {
  bucket        = var.bucket_name
  force_destroy = true
  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name        = var.resource-tag
    Environment = var.environment
  }
}

#configure the website for bucket
resource "aws_s3_bucket_website_configuration" "snake-xenzia-web" {
  depends_on = [aws_s3_bucket.snake-xenzia-bucket]
  bucket     = aws_s3_bucket.snake-xenzia-bucket.id

  index_document {
    suffix = var.object-key
  }
}

#allow the public access to the bucket
resource "aws_s3_bucket_public_access_block" "s3-public-access" {
  depends_on = [aws_s3_bucket_website_configuration.snake-xenzia-web]
  bucket     = aws_s3_bucket.snake-xenzia-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.snake-xenzia-bucket.id
  policy = data.aws_iam_policy_document.website_policy.json
}

#IAM policy to allow resource access
data "aws_iam_policy_document" "website_policy" {
  depends_on = [aws_s3_bucket_public_access_block.s3-public-access]
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    resources = [
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
  }
}

#clone the github repo to a folder
resource "null_resource" "clone_github_repo" {
  depends_on = [data.aws_iam_policy_document.website_policy]
  provisioner "local-exec" {
    command = "git clone ${var.github-repo} ./git-code"
  }
}

#copy the repo files to the s3 bucket
resource "null_resource" "upload_to_s3" {
  depends_on = [null_resource.clone_github_repo]

  provisioner "local-exec" {
    command = "aws s3 cp ${path.module}/git-code s3://${var.bucket_name}/ --recursive"
  }
}

#clean up the repo files
resource "null_resource" "clean_up_local_repo" {
  depends_on = [null_resource.upload_to_s3]
  provisioner "local-exec" {
    command = "rm -rf git-code"
  }
}






