terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  

  backend "remote" {
    organization = "shahid-test"

    workspaces {
      name = "shahid-actions-demo"
    }
  }
}



provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "newec3" {
  ami           = "ami-04db49c0fb2215364"
  instance_type = "t2.micro"
}
