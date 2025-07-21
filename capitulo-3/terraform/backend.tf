terraform {
  backend "s3" {
    bucket = "xpe-capitulo3"
    key    = "statefiles/capitulo3/terraform.tfstate"
    region = "us-east-1"
  }
}