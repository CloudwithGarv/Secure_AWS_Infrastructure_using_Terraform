variable "aws_region" {
  type        = string
  default     = "ap-south-1" # <-- Change from "us-east-1"
  description = "The AWS region to deploy resources into."
}

variable "project_name" {
  type        = string
  default     = "secure-aws-infrastructure"
  description = "Name prefix for all project resources."
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}
