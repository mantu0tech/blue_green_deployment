# Blue/Green Deployment Project

This repository contains the implementation of a **Blue/Green Deployment** strategy for seamless application updates with minimal downtime. Below are the steps and resources used in this project.

---

## Project Overview

The Blue/Green Deployment approach ensures:
- High availability during updates.
- Quick rollback to the previous version in case of issues.
- Simplified testing of the new version before full traffic routing.

---

## Steps to Implement

### 1. IAM Roles Setup
- Created roles for:
  - S3, CodeDeploy, CodePipeline, and Auto Scaling.
  - CodeDeploy-specific role.

### 2. Auto Scaling Group (ASG)
- Created a launch template.
- Added Security Group (SG) and IAM Role.
- Configured advanced user data for instance setup.
- Set up:
  - Desired capacity.
  - Load balancer with a new target group.

### 3. S3 Bucket
- Created an S3 bucket for storing code artifacts.

### 4. CodeDeploy
- Created an application in CodeDeploy.
- Configured a deployment group:
  - Attached the IAM Role.
  - Integrated the Auto Scaling Group and Target Group.

### 5. CodePipeline
- Configured a pipeline to automate deployment:
  - Used S3 for storing artifacts.
  - Integrated GitHub as the source.
  - Linked CodeDeploy as the deployment provider.

---

## Key Highlights
- **Load Balancer Integration:** Ensures smooth traffic switching.
- **User Data Scripts:** Automates instance setup with HTTPD and CodeDeploy Agent.
- **Error Troubleshooting:**
  - Resolved region-specific errors.
  - Verified user data logs using `/var/log/user-data.log`.

---

## Deployment Verification
- Verified successful deployment through CodeDeploy.
- Monitored traffic rerouting and instance termination.

---

## Cleanup
- Deleted all created resources post-deployment to avoid additional costs.

---

## Sample User Data Script
```bash
#!/bin/bash -xe
sudo yum update -y
sudo yum install httpd -y
echo 'Hello' | sudo tee /var/www/html/index.html
sudo systemctl restart httpd


Notes
The implementation is optimized for AWS and integrates seamlessly with GitHub repositories.
Ensure you adjust the region in the scripts for compatibility.
