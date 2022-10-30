#creating private subnet
resource "aws_subnet" "pri_sub" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.pricidr
  availability_zone = var.pri_av_zone

  tags = {
    Name = var.pri_name
  }
}
