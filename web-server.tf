# Obtain the single public subnet created in VPC
data "aws_subnet" "public" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.vpc_mg.id]
  }

  filter {
    name   = "tag:Tier"
    values = ["public"]
  }
}
#Launch an EC2 instance with bootstrapped Apache in each public subnet
resource "aws_instance" "web_server" {
  depends_on                  = [aws_subnet.public_subnets_mg]
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnet.public.id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.terraform_web_tier_sg.id]
  user_data                   = file("apache-install.sh")
  user_data_replace_on_change = true
  associate_public_ip_address = true

  tags = {
    Name        = "web-server"
    Environment = "dev"
  }
}