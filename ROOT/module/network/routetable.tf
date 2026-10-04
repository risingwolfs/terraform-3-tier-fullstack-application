# Route Table Creation for Public Subnet and association with Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt"
  }
}

#public subnet association
resource "aws_route_table_association" "public_rt_to_public_subnet-1_assoc_1" {
  subnet_id      = aws_subnet.public_subnet-1.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_rt_to_public_subnet-2_assoc_2" {
  subnet_id      = aws_subnet.public_subnet-2.id
  route_table_id = aws_route_table.public_rt.id
}

# Route Table Creation for Private Subnet and association with NAT Gateway
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "private-rt"
  }
}

#private subnate association ============================================================

#frontend
resource "aws_route_table_association" "private_rt_to_frontend_subnet-1_assoc_1" {
  subnet_id = aws_subnet.frontend_subnet-1.id
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "private_rt_to_frontend_subnet-2_assoc_2" {
  subnet_id = aws_subnet.frontend_subnet-2.id
  route_table_id = aws_route_table.private_rt.id  
}

#backend
resource "aws_route_table_association" "private_rt_to_backend_subnet-1_assoc_1" {
  subnet_id = aws_subnet.backend_subnet-1.id
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "private_rt_to_backend_subnet-2_assoc_2" {
  subnet_id = aws_subnet.backend_subnet-2.id
  route_table_id = aws_route_table.private_rt.id
}

#database
resource "aws_route_table_association" "private_rt_to_database_subnet-1_assoc_1" {
  subnet_id = aws_subnet.database_subnet-1.id
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "private_rt_to_database_subnet-2_assoc_1" {
  subnet_id = aws_subnet.database_subnet-2.id
  route_table_id = aws_route_table.private_rt.id
}