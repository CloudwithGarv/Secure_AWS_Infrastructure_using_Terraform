output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the deployed secure VPC."
}

output "public_instance_ip" {
  value       = aws_instance.web_server.public_ip
  description = "The public IP address of your web server."
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.secure_bucket.id
  description = "The globally unique name of your secured S3 Bucket."
}
