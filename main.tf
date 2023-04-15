#This Terraform script code Deploys Basic VPC Infra
provider "aws" {
  region     = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}



resource "aws_vpc" "default" {
  cidr_block       = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc_name}"
    Owner = "Suhel"
    environment = "${var.environment}"
  }
}


resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
  tags = {
    Name = "${var.IGW_name}"
  }
}

resource "aws_subnet" "subnet1-public" {
  vpc_id     ="${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet1_cidr}"
  availability_zone = "us-east-2a"
  tags = {
    Name = "${var.public_subnet1_name}"
  }
}

resource "aws_subnet" "subnet-private" {
  vpc_id     ="${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "us-east-2a"
  tags = {
    Name = "${var.private_subnet_name}"
  }
}
