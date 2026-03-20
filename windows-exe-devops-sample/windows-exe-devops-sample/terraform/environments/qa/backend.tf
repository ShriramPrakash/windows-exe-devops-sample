terraform {
  backend "s3" {
    bucket         = "mycompany-terraform-state"
    key            = "windows-exe-sample/qa/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}
