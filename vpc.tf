#Create custom VPC
resource "aws_vpc" "vpc_mg" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.tenancy
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "mg_vpc"
  }
}