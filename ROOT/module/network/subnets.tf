#public Subnet Creation
resource "aws_subnet" "subnet" {
#here we are using for_each to create multiple subnets based on the provided subnet names and their corresponding
# CIDR blocks and availability zones. The for_each expression creates a map where each key is a subnet name and the 
#value is an object containing the CIDR block and availability zone for that subnet.
  for_each = {
    for index, name in var.subnet_names :
    name => {
      cidr = var.subnet_ciders[index]
      az   = var.availability_zone[index % length(var.availability_zone)]
    }
  }

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key #subnet name will be used as the tag value for the Name tag from the subnet_names variable
  }
}

