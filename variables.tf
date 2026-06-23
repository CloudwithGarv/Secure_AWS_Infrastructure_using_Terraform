variable "aws_region" {
  type        = string
  default     = "ap-south-1" # <-- Change from "us-east-1"
  description = "The AWS region to deploy resources into."
}

variable "my_ip" {
  type        = string
  description = "Your local public IP address in CIDR notation (e.g., '192.0.2.1/32') to restrict SSH access."
}

variable "project_name" {
  type        = string
  default     = "secure-aws-infrastructure"
  description = "Name prefix for all project resources."
}
