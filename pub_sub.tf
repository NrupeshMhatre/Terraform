resource "aws_subnet" "pub_sub" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.pubcidr
  availability_zone = var.pub_av_zone

  tags = {
    Name = var.pub_name
  }
}
