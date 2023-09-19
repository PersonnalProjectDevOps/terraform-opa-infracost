# terraform-opa-infracost

This repository demonstrates best practices for secure Infrastructure as Code (IaC) using Terraform, Open Policy Agent (OPA), and Infracost. It features an example setup to create an AWS EC2 instance and an RDS database, along with a GitHub Actions workflow for automated validation and cost estimation.

## Overview

The example Terraform code provisions an AWS EC2 instance and an RDS database. The repository also includes a Rego policy that enforces specific constraints:

- Enforce the presence of specific tags (e.g., `env`, `team`)
- Prevent the destruction of RDS instances
- Ensure that the monthly cost for the EC2 instance is under $1
- Ensure that the monthly cost for the RDS instance is under $5

The GitHub Actions workflow runs on pull requests, validating the Terraform code, generating Infracost JSON output, and evaluating the Rego policy against the generated output. If any constraints are violated, the workflow will fail, preventing the pull request from being merged.

## Prerequisites

- Terraform v1.x
- Open Policy Agent (OPA)
- Infracost 
