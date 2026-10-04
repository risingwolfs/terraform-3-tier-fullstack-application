resource "aws_db_subnet_group" "subnet-group" {
 name = "my-db-subnet-group"
 description = "Subnet group for RDS instances"
  subnet_ids = var.subnet_ids
 tags = {
   Name = var.db_subnet_group_name
 }

}


resource "aws_db_instance" "rds" {
  identifier        = "mydb"
  db_name              = "cloud"
  username             = "admin"
  password             = var.db_password
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible  = true
  vpc_security_group_ids = [var.security_group_id]
}

