# Output values for security group IDs from resource database_sg (sg.tf)
output "database_sg_id" {
  value = aws_security_group.database_sg.id
}

# Output values for subnet IDs will be used in RDS module to create the subnet group for RDS instances from the database subnets created in the network module (subnets.tf)
output "db_subnet_ids" {
 value=[aws_subnet.subnet["database_subnet_1"].id,aws_subnet.subnet["database_subnet_2"].id]
}