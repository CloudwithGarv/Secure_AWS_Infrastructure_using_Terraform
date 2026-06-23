# Secure AWS Infrastructure on AWS using Terraform

A production-oriented AWS infrastructure project built with Terraform following Infrastructure as Code (IaC) principles. This project provisions a secure networking environment, compute resources, IAM-based access management, encrypted storage, and remote administration capabilities using AWS Systems Manager.

---

## Overview

This project demonstrates how to deploy and manage AWS infrastructure using Terraform while following security best practices such as:

- Network segmentation using public and private subnets
- Restricted SSH access using Security Groups
- IAM Roles for EC2 instances
- Systems Manager (SSM) for secure remote access
- Encrypted EBS volumes
- Encrypted S3 storage
- Public access blocking on S3 buckets
- Terraform remote state support using S3 backend

---

## Architecture

```text
                    Internet
                        │
                        ▼
                Internet Gateway
                        │
                        ▼
        ┌─────────────────────────────┐
        │            VPC              │
        │        10.0.0.0/16          │
        └─────────────────────────────┘
                 │             │
                 │             │
                 ▼             ▼

        Public Subnet      Private Subnet
        10.0.1.0/24        10.0.2.0/24
             │
             ▼

        EC2 Web Server
        (Amazon Linux 2023)
             │
             ├── IAM Role
             ├── SSM Access
             ├── Encrypted EBS
             └── Security Group

                    │

                    ▼

           Encrypted S3 Bucket
      (Public Access Completely Blocked)
```

---

## Features

### Networking

- Custom VPC (`10.0.0.0/16`)
- Public subnet (`10.0.1.0/24`)
- Private subnet (`10.0.2.0/24`)
- Internet Gateway
- Public Route Table
- Route Table Association

### Security

- Dedicated Security Group
- SSH restricted to a specific public IP
- HTTP access enabled for web traffic
- Least-privilege IAM configuration
- Systems Manager access without exposing SSH publicly

### Compute

- Amazon Linux 2023 EC2 instance
- Free Tier eligible instance type (`t3.micro`)
- Encrypted root EBS volume

### Storage

- Secure S3 bucket
- Server-side encryption enabled (AES256)
- Public access blocked
- Randomized globally unique bucket name

### Infrastructure Management

- Terraform remote state support
- Output variables for infrastructure resources
- Reusable variable-driven configuration

---

## Technology Stack

| Technology | Purpose |
|------------|----------|
| Terraform | Infrastructure as Code |
| AWS VPC | Networking |
| AWS EC2 | Compute |
| AWS IAM | Access Management |
| AWS Systems Manager | Secure Instance Access |
| AWS S3 | Storage & Terraform State |
| Security Groups | Firewall Rules |

---

## Project Structure

```text
.
├── main.tf
├── variables.tf
├── outputs.tf
├── images
├── backend_setup
└── README.md


```

### File Descriptions

| File | Description |
|--------|------------|
| `main.tf` | Infrastructure resources definition |
| `variables.tf` | Input variables |
| `outputs.tf` | Infrastructure outputs |
| `README.md` | Project documentation |

---

## Terraform Resources Created

### Networking

- AWS VPC
- Internet Gateway
- Public Subnet
- Private Subnet
- Route Table
- Route Table Association

### Security & IAM

- Security Group
- IAM Role
- IAM Instance Profile
- SSM Policy Attachment

### Compute

- EC2 Instance
- Encrypted EBS Volume

### Storage

- S3 Bucket
- Bucket Encryption Configuration
- Public Access Block Configuration

---

## Prerequisites

Before deployment ensure you have:

- AWS Account
- Terraform >= 1.0
- AWS CLI configured
- IAM permissions to create AWS resources

Verify:

```bash
terraform version
aws sts get-caller-identity
```

---

## Configuration

Update your public IP in `terraform.tfvars`:

```hcl
my_ip = "YOUR_PUBLIC_IP/32"
```

Example:

```hcl
my_ip = "203.0.113.10/32"
```

---

## Deployment Steps

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Validate Configuration

```bash
terraform validate
```

### 3. Review Execution Plan

```bash
terraform plan
```

### 4. Deploy Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

when prompted.

---

## Outputs

After deployment Terraform provides:

```bash
terraform output
```

Example outputs:

```text
vpc_id
public_instance_ip
s3_bucket_name
```

---

## Accessing the EC2 Instance

### Option 1: AWS Systems Manager (Recommended)

No SSH keys required.

1. Open AWS Systems Manager
2. Navigate to Session Manager
3. Start Session
4. Connect to the EC2 instance

### Option 2: EC2 Instance Connect

Use AWS Console access if SSH access is allowed from your IP.

---

## Security Best Practices Implemented

### Network Security

- Dedicated VPC
- Public and private subnet separation
- Route table isolation

### Access Control

- SSH restricted to trusted IP addresses
- IAM Role attached instead of hardcoded credentials
- SSM-based management access

### Data Protection

- Encrypted EBS root volume
- Encrypted S3 bucket
- Public S3 access blocked

### Infrastructure Security

- Terraform state backend support
- IAM least-privilege model
- Security Group controlled ingress

---

## Screenshots

### VPC

![images](./vpc.png)

### Subnets

![images](./subnets.png)

### Internet Gateway

![images](./internet-gateway.png)

### Route Table

![images](./route-table.png)

### Security Group

![images](./security-group.png)

### S3 Bucket

![images](./s3-buckets.png)

### EC2 Instance Connect

![images](./ec2-instance-connect.png)

### Systems Manager Session

![images](./ssm-session.png)

---

## Future Enhancements

- NAT Gateway for private subnet internet access
- Application Load Balancer
- Auto Scaling Group
- CloudWatch Monitoring
- RDS Database Deployment
- WAF Integration
- Multi-AZ Architecture
- CI/CD Pipeline using GitHub Actions

---

## Author

**Garv Garg**

Cloud & Security Engineer

