terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIAYEULWPO5PCKWRE7K"
  secret_key = "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"
}

resource "aws_security_group" "sg" {
  name        = "webserver"
  vpc_id      = "vpc-bbd4bdc0"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [ "10.0.0.0/24" ]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "webserver"
    User = "Supern"
  }
}

