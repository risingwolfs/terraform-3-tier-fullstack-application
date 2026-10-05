#vpc variables
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = ""
}

# =========================================================
variable "subnet_ciders" {
  description = "The CIDR block for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24", "10.0.7.0/24","10.0.8.0/24"]
}

variable "subnet_names" {
  description = "The name of the subnet"
  type        = list(string)
  default     = ["public_subnet_1", "public_subnet_2", "frontend_subnet_1", "frontend_subnet_2", "backend_subnet_1", "backend-subnet_2", "database_subnet_1", "database_subnet_2"]
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}