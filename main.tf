terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0953476d60561c955"
  instance_type = "t2.micro"

  tags = {
    Name = "machine1"
  }
}
variable "public_key" {
  type = string
}
resource "aws_key_pair" "example" {
  key_name   = "devops1"
  public_key = var.public_key
}
