# Terraform IAC Project

## Overview

This project uses Terraform to:

- Provision an EC2 instance

- Create an S3 bucket

- Add a security group to the EC2 instance and S3 bucket

## Prerequisites

- Terraform installed

- AWS CLI installed and configured

- An EC2 key pair created in your region

## Steps to Deploy

1. Clone this repo:https://github.com/seunara247/terraform-iac.git

  using bash:

  git clone https://github.com/seunara247/terraform-iac.git/terraform-iac.git
  
  cd terraform-iac

2. Initialize Terraform 

terraform init

3. Apply Infrastructure

terraform apply

4. to delete everything

terraform destroy

### Step 5: **Screenshots**

Take screenshots of:

- EC2 instance in AWS

- S3 bucket in AWS S3 Console

- Security group attached to the instance

Place them in `/screenshots` folder in your repo.

### Final Step: Push to GitHub

using bashbash

git init

git add .

git commit -m "Terraform project to create EC2, S3, and Security Group"

git remote add origin (your repo link)

git push -u origin main
(your repo link)
