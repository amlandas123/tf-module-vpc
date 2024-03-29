resource "aws_subnet" "public_subnet" {
  count = length(var.PUBLIC_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PUBLIC_SUBNET_CIDR,count.index)
  availability_zone = element(var.AZ,count.index)

  tags = {
    Name = "roboshop-${var.ENV}-public-${count.index+1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.PRIVATE_SUBNET_CIDR)  
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PRIVATE_SUBNET_CIDR,count.index)
  availability_zone = element(var.AZ,count.index)

  tags = {
    Name = "roboshop-${var.ENV}-private-${count.index+1}"
  }
}