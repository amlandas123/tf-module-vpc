resource "aws_vpc" "dasa" {
  cidr_block =  var.VPC_CIDR

    tags = {
        Name = "roboshop-${var.ENV}-vpc"
    }
}
