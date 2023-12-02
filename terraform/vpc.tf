resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = merge(var.default_tags, {
    name = "main"
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.default_tags, {
    Name = "igw"
  })
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.default_tags, {})
}

resource "aws_subnet" "subnets" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 1)
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[count.index]

  tags = merge(var.default_tags, {
    Name = "subnet-${count.index + 1}"
  })
}

resource "aws_route_table_association" "subnet_routes" {
  count = length(var.availability_zones)

  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.rt.id
}

