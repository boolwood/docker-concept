terraform {
  backend "s3" {
    bucket = "terraform-q3-state-bucket-12345"
    key    = "terraform.tfstate"
    region = "eu-north-1"
  }
}