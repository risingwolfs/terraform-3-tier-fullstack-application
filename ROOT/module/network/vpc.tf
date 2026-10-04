#VPC Creation
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

#internet Gateway Creation and attachment to VPC
resource "aws_internet_gateway" "igw" {
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = "igw"
  }
}

# Elastic IP Creation for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "nat-eip"
  }
}

# NAT Gateway Creation , eip association and attachment to public subnet 
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.subnet[var.subnet_names[0]].id # Attach NAT Gateway to the first public subnet
  tags = {
    Name = "nat-gw-1"
  }
}



