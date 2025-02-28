# Internet VPC
resource "aws_vpc" "myVPC" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "myVPC"
  }
}

# Subnets
resource "aws_subnet" "myVPC-public-1" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "myVPC-public-1"
  }
}

resource "aws_subnet" "myVPC-public-2" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-central-1b"

  tags = {
    Name = "myVPC-public-2"
  }
}

resource "aws_subnet" "myVPC-public-3" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-central-1c"

  tags = {
    Name = "myVPC-public-3"
  }
}

resource "aws_subnet" "myVPC-private-1" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "myVPC-private-1"
  }
}

resource "aws_subnet" "myVPC-private-2" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-central-1b"

  tags = {
    Name = "myVPC-private-2"
  }
}

resource "aws_subnet" "myVPC-private-3" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-central-1c"

  tags = {
    Name = "myVPC-private-3"
  }
}

# Internet GW
resource "aws_internet_gateway" "myVPC-gw" {
  vpc_id = aws_vpc.myVPC.id

  tags = {
    Name = "myVPC"
  }
}

# route tables
resource "aws_route_table" "myVPC-public-rt" {
  vpc_id = aws_vpc.myVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myVPC-gw.id
  }

  tags = {
    Name = "myVPC-public-rt"
  }
}

# route associations public
resource "aws_route_table_association" "myVPC-public-1-a" {
  subnet_id      = aws_subnet.myVPC-public-1.id
  route_table_id = aws_route_table.myVPC-public-rt.id
}

resource "aws_route_table_association" "myVPC-public-2-a" {
  subnet_id      = aws_subnet.myVPC-public-2.id
  route_table_id = aws_route_table.myVPC-public-rt.id
}

resource "aws_route_table_association" "myVPC-public-3-a" {
  subnet_id      = aws_subnet.myVPC-public-3.id
  route_table_id = aws_route_table.myVPC-public-rt.id
}

