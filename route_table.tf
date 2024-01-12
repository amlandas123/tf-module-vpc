resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

#   route {
#     ipv6_cidr_block        = "::/0"
#     egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#   }

  tags = {
    Name = "roboshop-${var.ENV}-public_rt"
  }
}
#subnet association of a route table depends on number of subnets(public or private),subnet id and rt_table_id
resource "aws_route_table_association" "public_subnet_association" {
  count = length(aws_subnet.public_subnet.*.id)  
  subnet_id = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }

# #   route {
# #     ipv6_cidr_block        = "::/0"
# #     egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
# #   }

  tags = {
    Name = "roboshop-${var.ENV}-private_rt"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  count = length(aws_subnet.private_subnet.*.id) 
  subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}