variable "db_subnet_group_name" {
  default = ""
}
#collecting multiple subnet_ids of database_subnets in a list 
variable "subnet_ids" {
  type = list(string)
}

variable "db_password" {
  default = ""
}
variable "security_group_id" {
  type = string
}