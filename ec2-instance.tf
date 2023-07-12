resource "aws_instance" "example_instance" {
  ami           = var.ami_id  
  instance_type = var.instance_type      
  subnet_id     = aws_subnet.public_subnet-1.id  
  key_name      = var.key_name  
  vpc_security_group_ids = ["${aws_security_group.terraform_sg.id}"]
  tags = {
    Name = var.instance_tags
  }
}