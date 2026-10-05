# Route Table Creation for Public Subnet and association with Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id     = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt"
  }
}

#public subnet association using for_each loop
resource "aws_route_table_association" "public_rt_to_public_subnet_association" {
  for_each       = toset([var.subnet_names[0], var.subnet_names[1]])
  subnet_id = aws_subnet.subnet[each.value].id
  route_table_id = aws_route_table.public_rt.id
}

# ================================================================================
# Route Table Creation for Private Subnet and association with NAT Gateway
resource "aws_route_table" "private_rt" {
  vpc_id     = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "private-rt"
  }
}

#private subnet association using for_each loop

resource "aws_route_table_association" "private_rt_to_private_subnet_association" {
  for_each       = toset([var.subnet_names[2], var.subnet_names[3], var.subnet_names[4], var.subnet_names[5], var.subnet_names[6], var.subnet_names[7]])
  subnet_id = aws_subnet.subnet[each.value].id
  route_table_id = aws_route_table.private_rt.id
}


