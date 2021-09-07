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
    region = "us-east-1"
  
}

resource "aws_s3_bucket" "shahidttts3" {
    bucket = "shahidterrbk"
    acl = "public-read"
    
    tags = {
      Name = "mybucket"
      Enviroment = "dev"

    }
  
}

resource "aws_s3_bucket_object" "sariqterra" {
    key = "sariq19189t111"
    storage_class = "STANDARD_IA"
    bucket = aws_s3_bucket.shahidttts3.id
   

    tags = {
      Name = "objectsariq198934"
    }
  
}

resource "aws_s3_bucket_object" "sariqtestah" {
    key = "sariqmmkt9"
    storage_class = "ONEZONE_IA"
    bucket = aws_s3_bucket.shahidttts3.id
  
  tags ={
    Name = "deveng"
  }
}
