# Obtain availability zones
data "aws_availability_zones" "available_azs" {
  state = "available"
}

# Create public subnets for webserver tier
resource "aws_subnet" "public_subnets_mg" {
  vpc_id                  = aws_vpc.vpc_mg.id
  cidr_block              = var.public_subnet_cidr  # Use the CIDR block directly from the variable
  availability_zone       = element(data.aws_availability_zones.available_azs.names, 0)  # Replace with correct index
  map_public_ip_on_launch = true


  tags = {
    Name = "tf_public_subnet"
    Tier = "public"
  }
}
