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
      name = "shahid-actions-demo"
    }
  }
}



provider "aws" {
 region = "us-east-2"
 #access_key = "AKIAY6DARVE2USKX6J5X"
 #secret_key = "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"
}

provider "aws" {
 region = "us-east-1"
 #access_key = "AKIAY6DARVE2USKX6J5X"
 #secret_key = "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"
 alias = "useast1"
}


resource "aws_instance" "webeast2" {
    instance_type = "t2.micro"
    ami = "ami-0a727a421bd5a51a3"
    key_name = "windowkey"
}

resource "aws_instance" "webeast1" {
    ami = "ami-029bfac3973c1bda1"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-00a1224620ceeeb48"]
    subnet_id = "subnet-0998c20976f75fb35"
    key_name = "LB"
  availability_zone = "us-east-1a"
  provider = aws.useast1
}
