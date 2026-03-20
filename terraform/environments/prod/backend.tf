terraform {
  backend "s3" {
    bucket         = "shriram-terraform-state-001"
    key            = "windows-exe-sample/prod/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-locks"
  }
}
