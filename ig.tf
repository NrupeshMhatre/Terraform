resource "aws_internet_gateway" "My_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.igw
  }
}