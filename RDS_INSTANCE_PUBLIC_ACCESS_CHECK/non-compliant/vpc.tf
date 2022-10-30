

resource "aws_vpc" "vpc" {
  cidr_block           = "10.20.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.projectname}-vpc"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.20.10.0/24"
  availability_zone = var.subnet-az-1

  tags = {
    Name = "${var.projectname}-subnet-1"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.20.20.0/24"
  availability_zone = var.subnet-az-2

  tags = {
    Name = "${var.projectname}-subnet-2"
  }
}

#Create IWG
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.projectname}_IGW"
  }
}

#Route Table creation - Public
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.projectname}_Public_RT"
  }
}

#Associate the Route table with Public Subnet
resource "aws_route_table_association" "public-route1" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "public-route2" {
  subnet_id      = aws_subnet.subnet-2.id
  route_table_id = aws_route_table.main.id
}

