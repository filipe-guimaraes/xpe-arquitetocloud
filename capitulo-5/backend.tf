terraform {
  backend "s3" {
    bucket = "xpe-capitulo5"
    key    = "statefiles/terraform.tfstate"
    region = "us-east-1"
  }
}