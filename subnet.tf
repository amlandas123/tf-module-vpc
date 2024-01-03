resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.public_subnet_cidr,count.index)

  tags = {
    Name = "roboshop-public"
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnet_cidr)  
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.private_subnet_cidr,count.index)

  tags = {
    Name = "roboshop-private"
  }
}