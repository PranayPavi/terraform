#Nate Gateway
resource "aws_nat_gateway" "nategw" {
  connectivity_type = var.connectivity_type
  subnet_id         = aws_subnet.private_subnet-1.id
  tags = {
    Name = "tf-nategw"
  }
}