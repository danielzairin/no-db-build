terraform {
  required_version = "~> 1.10.4"

  required_providers {
    aws = {
      version = "~> 5.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      Terraform = "true"
    }
  }
}

resource "aws_security_group" "instance" {
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "key_pair" {
  public_key = file("${path.module}/key.pem.pub")
}

resource "aws_instance" "instance" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.medium"
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name               = aws_key_pair.key_pair.key_name

  user_data = templatefile("${path.module}/user-data.sh", {
    APP_BASE_URL         = var.APP_BASE_URL
    CLOUDFLARE_API_TOKEN = var.CLOUDFLARE_API_TOKEN
    CLOUDFLARE_ZONE_ID   = var.CLOUDFLARE_ZONE_ID
  })

  user_data_replace_on_change = true
}
