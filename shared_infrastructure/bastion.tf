resource "aws_security_group" "b2c_bastion_inbound" {
  name = "b2c_bastion_inbound"
  vpc_id = aws_vpc.b2c_vpc.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0 
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "b2c_bastion_inbound"
  }
}

resource "aws_instance" "bastion_instance" {
  ami = "ami-0ceecbb0f30a902a6"
  instance_type = "t3.micro"
  associate_public_ip_address = true

  subnet_id = aws_subnet.b2c_subnets["public-1"].id
  vpc_security_group_ids = [aws_security_group.b2c_bastion_inbound.id]
  key_name = "b2c"

  tags = {
    Name = "b2c_bastion"
  }
}
