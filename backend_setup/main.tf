terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Generates a random 6-character string to ensure your S3 bucket name is globally unique
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# 1. The S3 Bucket for Secure State Storage
resource "aws_s3_bucket" "terraform_state" {
  bucket        = "secure-aws-tf-state-${random_string.suffix.result}"
  force_destroy = true 

  tags = {
    Name = "Terraform State Storage Vault"
  }
}

# Enable versioning so you can recover accidentally deleted state files
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Force AES256 encryption on the state file
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# 2. The DynamoDB Table for State Locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "secure-aws-tf-locks"
  billing_mode = "PAY_PER_REQUEST" # Keeps it inside the AWS Free Tier
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform State Lock Table"
  }
}

# 3. Output the exact names so we can use them in the next phase
output "state_bucket_name" {
  value       = aws_s3_bucket.terraform_state.id
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
}
