module "subnet_addrs" { 
  source = "hashicorp/subnets/cidr"

  base_cidr_block = "192.168.0.0/16"

  networks = [
    {
        name = "private-1"
        new_bits = 4
    },
    {
        name = "private-2"
        new_bits = 4
    },
    {
        name = "private-3"
        new_bits = 4
    },
    {
        name = "public-1"
        new_bits = 4
    },
    {
        name = "public-2"
        new_bits = 4
    },
    {
        name = "public-3"
        new_bits = 4
    }
  ]
}

resource "aws_vpc" "b2c_vpc" { 
  cidr_block = module.subnet_addrs.base_cidr_block
  tags = {
    Name = "b2c_vpc"
  }
}

resource "aws_subnet" "b2c_subnets" {
  for_each = module.subnet_addrs.network_cidr_blocks

  vpc_id = aws_vpc.b2c_vpc.id
  availability_zone = lookup(var.az_mapping, each.key)
  cidr_block = each.value
  tags = {
    Name = each.key
  }
}

resource "aws_internet_gateway" "b2c_igw" {
  vpc_id = aws_vpc.b2c_vpc.id
  tags = {
    Name = "b2c_igw"
  }
}

#resource "aws_route_table" "b2c_route_table" {
#  vpc_id = aws_vpc.b2c_vpc.id
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.b2c_igw.id
#  }
#}

resource "aws_route" "b2c_default_route" { 
  route_table_id = aws_vpc.b2c_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.b2c_igw.id
}
