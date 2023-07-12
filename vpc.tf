#VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "terraform-vpc"
  }
}

#Public subnet
resource "aws_subnet" "public_subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_blocks[0]
  availability_zone = var.availability_zones[0]

  tags = {
    Name = "tf-public-subnet-1"
  }
}
resource "aws_subnet" "public_subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_blocks[1]
  availability_zone = var.availability_zones[1]

  tags = {
    Name = "tf-public-subnet-2"
  }
}

#Private Subnet
resource "aws_subnet" "private_subnet-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_blocks[0]  
  availability_zone = var.availability_zones[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "tf-Private-Subnet-1"
  }
}
resource "aws_subnet" "private_subnet-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_blocks[1]  
  availability_zone = var.availability_zones[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "tf-Private-Subnet-2"
  }
}


#Rout table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  #subnet_id  = [aws_subnet.public_subnet-1.id, aws_subnet.public_subnet-2.id]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "tf-routetable-public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  #subnet_id  = [aws_subnet.private_subnet-1.id, aws_subnet.private_subnet-2.id]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nategw.id
  }

  tags = {
    Name = "tf-routetable-private"
  }
}

#Routtable Association
resource "aws_route_table_association" "pvt-subnet_association-1" {
  subnet_id      = aws_subnet.private_subnet-1.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "pvt-subnet_association-2" {
  subnet_id      = aws_subnet.private_subnet-2.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "pub-subnet_association-1" {
  subnet_id      = aws_subnet.public_subnet-1.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "pub-subnet_association-2" {
  subnet_id      = aws_subnet.public_subnet-2.id
  route_table_id = aws_route_table.public.id
}

#Security Group
resource "aws_security_group" "terraform_sg" {
  name        = var.sg_name
  description = "terraform security group"

  vpc_id = aws_vpc.main.id  

  ingress {
    from_port   = var.sg_ingress_ports[0]
    to_port     = var.sg_ingress_ports[0]
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr_blocks
  }

  ingress {
    from_port   = var.sg_ingress_ports[1]
    to_port     = var.sg_ingress_ports[1]
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr_blocks
  }

  egress {
    from_port   = var.sg_egress_ports[0]
    to_port     = var.sg_egress_ports[0]
    protocol    = "-1"
    cidr_blocks = var.sg_cidr_blocks
  }
}
