resource "aws_vpc" "main" {
  #Name  = "Ramya-2.7-VPC"
  cidr_block = var.cidr_block
  enable_dns_support =  true
  enable_dns_hostnames = true
  
  tags = {
    Name = "Ramya-2.7-VPC"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "Ramya-public-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Ramya-igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "Ramya-public-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt.id
}