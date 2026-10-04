#public Subnet Creation
resource "aws_subnet" "public_subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_1
  availability_zone       = var.availability_zone_1

  tags = {
    Name = "public-subnet-1"
  }
}
resource "aws_subnet" "public_subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_2
  availability_zone       = var.availability_zone_2

  tags = {
    Name = "public-subnet-2"
  }
}

#private frontend Subnet Creation
resource "aws_subnet" "frontend_subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.frontend_subnet_cidr_1
  availability_zone       = var.availability_zone_1

  tags = {
    Name = "frontend-subnet-1"
  }
}

resource "aws_subnet" "frontend_subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.frontend_subnet_cidr_2
  availability_zone       = var.availability_zone_2

  tags = {
    Name = "frontend-subnet-2"
  }
}

#private backend Subnet Creation
resource "aws_subnet" "backend_subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.backend_subnet_cidr_1
  availability_zone       = var.availability_zone_1

  tags = {
    Name = "backend-subnet-1"
  }
}

resource "aws_subnet" "backend_subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.backend_subnet_cidr_2
  availability_zone       = var.availability_zone_2

  tags = {
    Name = "backend-subnet-2"
  }
}

#private database Subnet Creation
resource "aws_subnet" "database_subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.database_subnet_cidr_1
  availability_zone       = var.availability_zone_1

  tags = {
    Name = "database-subnet-1"
  }
}

resource "aws_subnet" "database_subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.database_subnet_cidr_2
  availability_zone       = var.availability_zone_2

  tags = {
    Name = "database-subnet-2"
  }
}

#exporting database subnets by output into main.tf ,so that it can be accessed in rds module
output "db-subnet-ids" {
  value = [
    aws_subnet.database_subnet-1.id,
    aws_subnet.database_subnet-2.id
  ]
}