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
 #access_key = "AKIAY6DARVE24SIS74T2"
 #secret_key = "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"
}

provider "aws" {
  region = "us-east-1"
 #access_key = "AKIAY6DARVE24SIS74T2"
 #secret_key = "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"
  alias = "useast1"
}

provider "aws" {
  region = "ap-south-1"
 #access_key = "AKIAY6DARVE2USKX6J5X"
 #secret_key = "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"
 alias = "apsouth1"
}


resource "aws_instance" "webeast2" {
    instance_type = "t2.micro"
    ami = "ami-0a727a421bd5a51a3"
    key_name = "windowkey"
  tags = {
    Name = "webeast2"
  }
}

resource "aws_instance" "webeast1" {
    ami = "ami-029bfac3973c1bda1"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-00a1224620ceeeb48"]
    subnet_id = "subnet-0998c20976f75fb35"
    key_name = "LB"
  availability_zone = "us-east-1a"
  provider = aws.useast1
tags = {
    Name = "webeast1"
  }
}

resource "aws_instance" "mumbai" {
    ami = "ami-0300b3c1504b56ca4"
    instance_type = "t2.micro"
    key_name = "mumbai"
    provider = aws.apsouth1
  tags = {
    Name = "mumbaivm"
  }
}
