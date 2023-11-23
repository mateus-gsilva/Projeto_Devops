resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    name = "main"
  }
}

resource "aws_subnet" "subnet_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 1)
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones_az1
}

resource "aws_subnet" "subnet_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 2)
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones_az2
}

resource "aws_subnet" "subnet_az3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 3)
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones_az3
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "subnet_route_az1" {
  subnet_id      = aws_subnet.subnet_az1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "subnet_route_az2" {
  subnet_id      = aws_subnet.subnet_az2.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "subnet_route_az3" {
  subnet_id      = aws_subnet.subnet_az3.id
  route_table_id = aws_route_table.rt.id
}