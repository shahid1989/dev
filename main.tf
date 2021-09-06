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
  required_version = ">= 0.14"

  backend "remote" {
    organization = "shahid-test"

    workspaces {
      name = "hahid-actions-demo"
    }
  }
}


provider "aws" {
  region = "ap-south-1"
}
 

resource "aws_instance" "newec3" {
  ami           = "ami-0300b3c1504b56ca4"
  instance_type = "t2.micro"
}
