#creating elastic IP with NAT Gateway
resource "aws_eip" "nat_gw_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.pub_sub.id

  tags = {
    Name = var.nat_name
  }
}
