resource "aws_subnet" "public_subnet" {
  count = length(var.PUBLIC_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PUBLIC_SUBNET_CIDR,count.index)

  tags = {
    Name = "roboshop-public"
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.PRIVATE_SUBNET_CIDR)  
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PRIVATE_SUBNET_CIDR,count.index)

  tags = {
    Name = "roboshop-private"
  }
}