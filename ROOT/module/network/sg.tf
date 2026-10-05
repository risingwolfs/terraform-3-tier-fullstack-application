#public security group =======================================================
resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "public_sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "public_sg_inbound" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  #   from_port         = 443
  #   ip_protocol       = "tcp"
  #   to_port           = 443
  ip_protocol = "-1" # allow all ports
}

resource "aws_vpc_security_group_egress_rule" "public_sg_outbound" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

#frontend security group ===================================================================
resource "aws_security_group" "frontend_sg" {
  name        = "frontend_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "frontend_sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "frontend_sg_inbound" {
  security_group_id = aws_security_group.frontend_sg.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  #   from_port         = 443
  #   ip_protocol       = "tcp"
  #   to_port           = 443
  ip_protocol = "-1" # allow all ports
}

resource "aws_vpc_security_group_egress_rule" "frontend_sg_outbound" {
  security_group_id = aws_security_group.frontend_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


#backend security group =========================================================================
resource "aws_security_group" "backend_sg" {
  name        = "backend_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "backend_sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "backend_sg_inbound" {
  security_group_id = aws_security_group.backend_sg.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  #   from_port         = 443
  #   ip_protocol       = "tcp"
  #   to_port           = 443
  ip_protocol = "-1" # allow all ports
}

resource "aws_vpc_security_group_egress_rule" "backend_sg_outbound" {
  security_group_id = aws_security_group.backend_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

#database security group ================================================================
resource "aws_security_group" "database_sg" {
  name        = "database_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "database_sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "database_sg_inbound" {
  security_group_id = aws_security_group.database_sg.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  #   from_port         = 443
  #   ip_protocol       = "tcp"
  #   to_port           = 443
  ip_protocol = "-1" # allow all ports
}

resource "aws_vpc_security_group_egress_rule" "database_sg_outbound" {
  security_group_id = aws_security_group.database_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
