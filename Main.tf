# VPC RESOURCE
resource "aws_vpc" "Prod-Vpc" {
  cidr_block           = var.Vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Prod-Vpc"
  }
}

# SUBNET RESOURCE
resource "aws_subnet" "Prod-pub-Sub-1" {
  vpc_id     = aws_vpc.Prod-Vpc.id
  cidr_block = var.Prod-pub-sub-1-cidr

  tags = {
    Name = "Prod-pub-Sub-1"
  }
}


# SUBNET RESOURCE
resource "aws_subnet" "Prod-pub-Sub-2" {
  vpc_id     = aws_vpc.Prod-Vpc.id
  cidr_block = var.Prod-pub-sub-2-cidr

  tags = {
    Name = "Prod-pub-Sub-2"
  }
}


# SUBNET RESOURCE
resource "aws_subnet" "Prod-pri-Sub-1" {
  vpc_id     = aws_vpc.Prod-Vpc.id
  cidr_block = var.Prod-pri-sub-1-cidr

  tags = {
    Name = "Prod-pri-Sub-1"
  }
}


# SUBNET RESOURCE
resource "aws_subnet" "Prod-pri-Sub-2" {
  vpc_id     = aws_vpc.Prod-Vpc.id
  cidr_block = var.Prod-pri-sub-2-cidr

  tags = {
    Name = "Prod-pri-Sub-2"
  }
}


# ROUTE TABLE RESOURCE
resource "aws_route_table" "Prod-Pub-Route-Table" {
  vpc_id = aws_vpc.Prod-Vpc.id


  tags = {
    Name = "Prod-Pub-Route-Table"
  }
}





# ROUTE TABLE RESOURCE
resource "aws_route_table" "Prod-Pri-Route-Table" {
  vpc_id = aws_vpc.Prod-Vpc.id


  tags = {
    Name = "Prod-Pri-Route-Table"
  }
}




# ROUTE TABLE ASSOCIATION RESOURCE
resource "aws_route_table_association" "Prod-Route-Table-Ass-Pub-1" {
  subnet_id      = aws_subnet.Prod-pub-Sub-1.id
  route_table_id = aws_route_table.Prod-Pub-Route-Table.id
}


# ROUTE TABLE ASSOCIATION RESOURCE
resource "aws_route_table_association" "Prod-Route-Table-Ass-Pub-2" {
  subnet_id      = aws_subnet.Prod-pub-Sub-2.id
  route_table_id = aws_route_table.Prod-Pub-Route-Table.id
}


# ROUTE TABLE ASSOCIATION RESOURCE
resource "aws_route_table_association" "Prod-Route-Table-Ass-Pri-1" {
  subnet_id      = aws_subnet.Prod-pri-Sub-1.id
  route_table_id = aws_route_table.Prod-Pri-Route-Table.id
}

# ROUTE TABLE ASSOCIATION RESOURCE
resource "aws_route_table_association" "Prod-Route-Table-Ass-Pri-2" {
  subnet_id      = aws_subnet.Prod-pri-Sub-2.id
  route_table_id = aws_route_table.Prod-Pri-Route-Table.id
}

# INTERNET GATEWAY RESOURCE
resource "aws_internet_gateway" "Prod-IGW" {
  vpc_id = aws_vpc.Prod-Vpc.id

  tags = {
    Name = "Prod-IGW"
  }
}


# ROUTE RESOURCE
resource "aws_route" "r" {
  route_table_id         = aws_route_table.Prod-Pub-Route-Table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.Prod-IGW.id

}
