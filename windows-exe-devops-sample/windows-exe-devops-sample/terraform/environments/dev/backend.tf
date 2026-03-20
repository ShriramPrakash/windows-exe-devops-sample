terraform {
  backend "s3" {
    bucket         = "mycompany-terraform-state"
    key            = "windows-exe-sample/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}
