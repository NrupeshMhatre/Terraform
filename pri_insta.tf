#creting private instance
resource "aws_instance" "B_instance" {
  ami           = var.ami_idd
  instance_type = var.instance_types
  key_name = var.key_names
  vpc_security_group_ids = [ aws_security_group.B_Security.id ]
  subnet_id = aws_subnet.pri_sub.id
  associate_public_ip_address = false

  tags = {
    Name = var.tag_names
  }
}