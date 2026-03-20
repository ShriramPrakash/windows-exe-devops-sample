# Windows EXE DevOps Sample with Separate Terraform Environments

This sample project shows a simple but industry-style DevOps setup for a Windows EXE application using:

- GitHub and GitHub Actions
- Terraform with separate environments: dev, qa, prod
- AWS S3 for artifacts
- AWS SSM for deployment to Windows EC2

## Branch and deployment flow

1. Developer creates a feature branch
2. Developer raises a PR to `main`
3. `pr-checks.yml` validates app files and Terraform
4. After merge to `main`, `build-and-deploy-dev.yml`:
   - builds the Windows EXE
   - uploads it to the Dev S3 bucket
   - deploys it to the Dev Windows EC2 through SSM
5. `promote-to-qa.yml` manually promotes the same EXE from Dev S3 to Release S3 and deploys to QA
6. `deploy-prod.yml` manually deploys the same QA-approved release artifact to Prod

## Terraform environments

- `terraform/environments/dev`
- `terraform/environments/qa`
- `terraform/environments/prod`

Each environment has its own:
- backend key
- variables
- tfvars
- state isolation

## Required GitHub Secrets

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `DEV_BUCKET`
- `RELEASE_BUCKET`
- `DEV_WINDOWS_INSTANCE_ID`
- `QA_WINDOWS_INSTANCE_ID`
- `PROD_WINDOWS_INSTANCE_ID`

## Important placeholders to update

Before using this project, update these values:

- `ami-xxxxxxxxxxxxxxxxx` in each `terraform.tfvars`
- backend bucket and DynamoDB lock table in each `backend.tf`
- GitHub Secrets listed above
- S3 bucket names if you want different naming

## Workflow files

- `pr-checks.yml`
- `terraform-dev.yml`
- `terraform-qa.yml`
- `terraform-prod.yml`
- `build-and-deploy-dev.yml`
- `promote-to-qa.yml`
- `deploy-prod.yml`
