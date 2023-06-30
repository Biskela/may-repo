# NAT GATEWAY ONE
/*resource "aws_nat_gateway" "Prod-Nat-GW-1" {
  allocation_id = aws_eip.Eip-for-Prod-NGW-1.id
  subnet_id     = aws_subnet.Prod-pub-Sub-1.id

  tags = {
    Name = "Prod-Nat-GW-1"
  }
}


# NAT GATEWAY TWO
resource "aws_nat_gateway" "Prod-Nat-GW-2" {
  allocation_id = aws_eip.Eip-for-Prod-NGW-2.id
  subnet_id     = aws_subnet.Prod-pub-Sub-2.id

  tags = {
    Name = "Prod-Nat-GW-2"
  }
}



resource "aws_route_table" "Prod-Pri-Route-Table" {
  vpc_id = aws_vpc.Prod-Vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Prod-Nat-GW-1.id
  }

  

  tags = {
    Name = "Prod-Pri-Route-Table"
  }
}*/


# CREATE NAT GATEWAY
resource "aws_nat_gateway" "Prod-Nat-GW" {
  allocation_id = aws_eip.Eip-for-Prod-NGW.id
  subnet_id     = aws_subnet.Prod-pub-Sub-1.id

  tags = {
    Name = "Prod-Nat-GW"
  }


}

# NAT ASSOCIATION ROUTE
resource "aws_route" "Prod-Pri-Route-Table" {
  route_table_id         = aws_route_table.Prod-Pri-Route-Table.id
  nat_gateway_id         = aws_nat_gateway.Prod-Nat-GW.id
  destination_cidr_block = "0.0.0.0/0"
}