#creating routetable
resource "aws_route_table" "Public_RT" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = var.pub_RT
        gateway_id = aws_internet_gateway.My_igw.id
    }

    tags = {
        Name = var.pub_RT_name
    }
}

#associating route table to public subnet
resource "aws_route_table_association" "Pub_RT_ass" {
    subnet_id = aws_subnet.pub_sub.id
    route_table_id = aws_route_table.Public_RT.id
}