module "vpc" {
  source   = "../../module/network"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "dev-vpc-1"
}

module "rds" {
  source = "../../module/rds"
  #accessing the db-subnets from infrastructure mudolule where it has been declared
  db_subnet_ids = module.vpc.db_subnet_ids
  db_subnet_group_name="db-sub-group"
  db_password = "AdminMukesh"
  #accessing security group id
  security_group_id    = module.vpc.database_sg_id
}