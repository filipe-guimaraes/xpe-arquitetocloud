terraform {
  backend "s3" {
    bucket = "xpe-atividademodular" #Renomeie o nome do bucket obrigatoriamente
    key    = "xpeducacao/terraform.tfstate"
    region = "us-east-1"
  }
}
