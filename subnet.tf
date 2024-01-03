resource "aws_subnet" "public_subnet" {
  count = length(var.Public_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.Public_subnet_cidr,count.index)

  tags = {
    Name = "roboshop-public"
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.Private_subnet_cidr)  
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.Private_subnet_cidr,count.index)

  tags = {
    Name = "roboshop-private"
  }
}