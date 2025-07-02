resource "aws_instance" "my-very-special-ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  subnet_id              = aws_subnet.privatesubnet.id
  vpc_security_group_ids = [aws_security_group.mysecuritygroup.id]
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_vpc" "EC2vpc" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.EC2vpc.id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "privatesubnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.EC2vpc.id

  tags = {
    Name = "EC2-IGW"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.EC2vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "EC2-RT"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "mysecuritygroup" {
  vpc_id = aws_vpc.EC2vpc.id

  ingress {
    protocol  = "tcp"
    self      = false
    from_port = 80
    to_port   = 80
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}