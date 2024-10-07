#Create a security group that allows traffic from the internet 
resource "aws_security_group" "terraform_web_tier_sg" {
  name   = "terraform-sg-web"
  vpc_id = aws_vpc.vpc_mg.id

  ingress {
    description = "Allow all SSH"
    from_port   = var.SSH
    to_port     = var.SSH
    protocol    = var.tcp
    cidr_blocks = [var.cidr]
  }

  ingress {
    description = "Allow all HTTP"
    from_port   = var.HTTP
    to_port     = var.HTTP
    protocol    = var.tcp
    cidr_blocks = [var.cidr]
  }

  egress {
    description = "Allow all outbound"
    from_port   = var.egress_all
    to_port     = var.egress_all
    protocol    = var.egress
    cidr_blocks = [var.cidr]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Terraform SG"
  }
}