resource "aws_instance" "gfg-ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public-subnet.id
  tags = {
    Name = "HelloWorld"
  }
  count = 2
  vpc_security_group_ids = [aws_security_group.gfg-sg-gfg-48-vpc.id]
}



resource "aws_security_group" "gfg-sg-gfg-48-vpc" {
  name = "gfg-sg-gfg-48-vpc"
  vpc_id = aws_vpc.gfg-vpc.id
  dynamic ingress  {
    for_each  = var.allowed_inbound_ports
    content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}