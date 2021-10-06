resource "aws_vpc" "dev-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true" # will give internel domain name
  enable_dns_hostnames = "true" # will give internel hostname
  enable_classiclink   = "false"
  instance_tenancy     = "default"

  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "dev-subnet-public-1" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" # this will make public subnet
  availability_zone       = "us-west-2a"

  tags = {
    Name = "dev-subnet-public-1"
  }
}
