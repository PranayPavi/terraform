#Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  #subnet_id  = "${aws_subnet.public_subnet-1.id}"

  tags = {
    Name = "tf-igw"
  }
}
