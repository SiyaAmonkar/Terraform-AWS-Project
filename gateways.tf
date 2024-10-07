#Create Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_mg.id
  tags = {
    Name = "mg_igw"
  }
}

