variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"

}

variable "tenancy" {
  type    = string
  default = "default"

}

variable "true" {
  type    = bool
  default = true

}

variable "public_subnet_cidr" {

  type = string
  default = "10.0.1.0/24"

}


variable "cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "SSH" {
  type    = string
  default = "22"
}

variable "tcp" {
  type    = string
  default = "tcp"
}

variable "HTTP" {
  type    = string
  default = "80"
}

variable "egress_all" {
  type    = string
  default = "0"
}

variable "egress" {
  type    = string
  default = "-1"
}

variable "ami" {
  description = "AMI"
  type        = string
  default     = "Add-your-account-ami-id"
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key Name"
  type        = string
  default     = "Enter-account-key-pair"
}