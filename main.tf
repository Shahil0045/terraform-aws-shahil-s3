terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "6.0.0-beta3"
        }

        random = {
        source = "hashicorp/random"
        version = "3.7.2"
    }
    }
}

provider "aws" {
    region = "ap-south-1"
}

resource "random_id" "rand_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "demo_bucket" {
    bucket = "tf-cloud-${random_id.rand_id.hex}"

    tags = {
        Name        = "Test Bucket"
        Environment = "Testing"
    }
  
}