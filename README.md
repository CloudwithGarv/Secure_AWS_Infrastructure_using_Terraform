# 🚀 Secure Multi-Tier AWS Infrastructure using Terraform

A production-style AWS infrastructure project built using Terraform that demonstrates Infrastructure as Code (IaC), cloud security best practices, monitoring, load balancing, and database deployment on AWS.

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge\&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge\&logo=amazonaws)
![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-2088FF?style=for-the-badge\&logo=github-actions)

---

# 📖 Overview

This project provisions a secure multi-tier AWS environment using Terraform.

The infrastructure includes:

* Custom VPC
* Public & Private Subnets
* Internet Gateway
* Route Tables
* Security Groups
* EC2 Web Server
* Application Load Balancer (ALB)
* RDS MySQL Database
* IAM Roles & Instance Profiles
* AWS Systems Manager (SSM)
* CloudWatch Monitoring
* Encrypted S3 Storage
* GitHub Actions CI/CD

---

# 🏗 Architecture

```text
Internet
    │
    ▼
Application Load Balancer
    │
    ▼
EC2 Web Server
    │
    ▼
RDS MySQL Database

CloudWatch Monitoring
IAM + SSM Management
Encrypted S3 Storage
```

---

# ☁ AWS Services Used

| Service          | Purpose                       |
| ---------------- | ----------------------------- |
| VPC              | Network Isolation             |
| Subnets          | Public & Private Segmentation |
| Internet Gateway | Internet Connectivity         |
| Route Tables     | Traffic Routing               |
| Security Groups  | Network Security              |
| EC2              | Application Hosting           |
| ALB              | Traffic Distribution          |
| RDS MySQL        | Managed Database              |
| IAM              | Access Management             |
| Systems Manager  | Secure Instance Access        |
| CloudWatch       | Monitoring & Logging          |
| S3               | Secure Storage                |
| GitHub Actions   | CI/CD Automation              |

---

# 🔒 Security Features

* SSH-less administration using AWS Systems Manager (SSM)
* Security Group segmentation between ALB, EC2, and RDS
* Encrypted EBS storage
* Encrypted S3 bucket
* Private RDS deployment
* Least-privilege IAM role configuration
* Multi-AZ database subnet group

---

# 📸 Infrastructure Screenshots

## VPC Dashboard

![VPC Dashboard](images/vpc-dashboard.png)

---

## VPC Details

![VPC](images/vpc.png)

---

## Subnets

![Subnets](images/subnets.png)

---

## Internet Gateway

![Internet Gateway](images/internet-gateway.png)

---

## Route Table Configuration

![Route Table](images/route-table.png)

---

## Security Groups

![Security Groups](images/security-groups.png)

---

## EC2 Instance

![EC2 Instance](images/ec2-instance.png)

---

## EC2 Instance Details

![EC2 Connect](images/ec2-instance-connect.png)

---

## Systems Manager Session

![SSM Session](images/ssm-session.png)

---

## Application Load Balancer

![ALB](images/alb.png)

---

## Target Group Health Check

![Target Group](images/target-group.png)

---

## Application Access Through ALB

![ALB Webpage](images/alb-webpage.png)

---

## RDS MySQL Database

![RDS Database](images/rds-database.png)

---

## CloudWatch Alarm

![CloudWatch Alarm](images/cloudwatch-alarm.png)

---

## CloudWatch Logs

![CloudWatch Logs](images/cloudwatch-logs.png)

---

## S3 Buckets

![S3 Bucket](images/s3-buckets.png)

---

## S3 Bucket Encryption

![S3 Encryption](images/s3-encryption.png)

---

## GitHub Actions Workflow

![GitHub Actions](images/github-actions.png)

---

## Terraform Deployment

![Terraform Apply 1](images/terraform-apply1.png)

![Terraform Apply 2](images/terraform-apply2.png)

---

# ⚙ Terraform Resources Provisioned

### Networking

* AWS VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* Route Tables

### Security

* IAM Role
* IAM Instance Profile
* Security Groups

### Compute

* Amazon Linux 2023 EC2 Instance

### Load Balancing

* Application Load Balancer
* Target Group
* Listener

### Database

* RDS MySQL Instance
* DB Subnet Group

### Monitoring

* CloudWatch Log Group
* CloudWatch Alarm

### Storage

* Encrypted S3 Bucket

---

# 🚀 Deployment

Clone the repository:

```bash
git clone https://github.com/CloudwithGarv/Secure_AWS_Infrastructure_using_Terraform.git

cd Secure_AWS_Infrastructure_using_Terraform
```

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Generate execution plan:

```bash
terraform plan
```

Deploy infrastructure:

```bash
terraform apply
```

Destroy infrastructure:

```bash
terraform destroy
```

---

# 🔧 Variables

Create a local file:

```bash
terraform.tfvars
```

Example:

```hcl
db_password = "CHANGE_ME"
```

---

# 📊 Outputs

Terraform generates:

* Application Load Balancer DNS
* EC2 Public IP
* RDS Endpoint
* S3 Bucket Name
* VPC ID

---

# 🔄 CI/CD

GitHub Actions automatically performs:

* Terraform Init
* Terraform Format Check
* Terraform Validate

Workflow location:

```text
.github/workflows/terraform.yml
```

---

# 🎯 Resume Highlights

* Designed and deployed a secure multi-tier AWS infrastructure using Terraform.
* Implemented Infrastructure as Code (IaC) practices with automated provisioning.
* Configured VPC, EC2, ALB, RDS MySQL, CloudWatch, IAM, and S3 services.
* Enforced least-privilege security controls and network segmentation.
* Utilized AWS Systems Manager (SSM) for secure administration without SSH.
* Automated Terraform validation using GitHub Actions CI/CD workflows.

---

# 👨‍💻 Author

**Garv Garg**

GitHub: https://github.com/CloudwithGarv

LinkedIn: https://www.linkedin.com/in/cloudwithgarv/

---

⭐ If you found this project useful, consider starring the repository.
