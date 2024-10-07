#Create route table for public subnets
resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.vpc_mg.id

  route {
    cidr_block = var.cidr
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "mg_public_rtb"
    Tier = "public"
  }
}



## Create public route table association
resource "aws_route_table_association" "public" {
  depends_on     = [aws_subnet.public_subnets_mg]  # Updated to single subnet resource
  route_table_id = aws_route_table.public_rtb.id
  subnet_id      = aws_subnet.public_subnets_mg.id  # Reference to the single public subnet
}

