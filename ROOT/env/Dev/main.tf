module "infrastructure" {
  source   = "../../module/network"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "dev-vpc-1"

  #availability 
  # availability_zone_1 = "us-east-1a"
  # availability_zone_2 = "us-east-1b"

  #subnet value provision

}

# module "database" {
#   source = "../../../modules/database"
#   #accessing the db-subnets from infrastructure mudolule where it has been declared
#   subnet_ids = module.infrastructure.db-subnet-ids
#   db_subnet_group_name="db-sub-group"
#   db_password = "AdminMukesh"
#   #accessing security group id
#   security_group_id    = module.infrastructure.database_sg_id
# }