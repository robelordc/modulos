provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "platzi-instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  tags = var.tags
  security_groups = ["${aws_security_group.ssh-connetion.name}"]
}

resource "aws_security_group" "ssh-connetion" {
  name        = "var.sg_name"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "-1"
    # cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

dynamic "ingress" {
  for_each = var.ingress_rules
  content {
    from_port        = ingress.value.from_port
    to_port          = ingress.value.to_port
    protocol         = ingress.value.protocol
    cidr_blocks      = ingress.value.cidr_blocks
  }
}

}