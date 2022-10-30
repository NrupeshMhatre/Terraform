#creating routetable for private subnet
resource "aws_route_table" "Private_RT" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = var.pri_RT
        nat_gateway_id = aws_nat_gateway.nat_gw.id
    }

    tags = {
        Name = var.pri_RT_name
    }
}
#associating private
resource "aws_route_table_association" "Pri_RT_ass" {
    subnet_id = aws_subnet.pri_sub.id
    route_table_id = aws_route_table.Private_RT.id
}