#creting public instance
resource "aws_instance" "A_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.A_Security.id ]
  subnet_id = aws_subnet.pub_sub.id
  associate_public_ip_address = true

  tags = {
    Name = var.tag_name
  }
}