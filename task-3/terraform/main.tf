# Generate a private key
resource "tls_private_key" "example_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create a key pair in AWS using the generated public key
resource "aws_key_pair" "demo_key_pair" {
  key_name   = "demo-key"
  public_key = tls_private_key.example_key.public_key_openssh
}

# Save the private key to a local file (optional)
resource "local_file" "private_key" {
  filename = "${path.module}/demo-key.pem"
  content  = tls_private_key.example_key.private_key_pem
  file_permission = "0400"
}

# VPC Resource
resource "aws_vpc" "demo_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "demo-vpc"
  }
}

# Subnet Resource
resource "aws_subnet" "demo_subnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = "demo-subnet"
  }
}

# Security Group Resource
resource "aws_security_group" "demo_sg" {
  vpc_id = aws_vpc.demo_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# Egress Rules (Allow all outgoing traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # "-1" means all protocols
    cidr_blocks = ["0.0.0.0/0"] # Allow to any destination
  }

  tags = {
    Name = "demo-security-group"
  }
}

# Internet Gateway Resource
resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "demo-igw"
  }
}

# Route Table Resource
resource "aws_route_table" "demo_route_table" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }

  tags = {
    Name = "demo-route-table"
  }
}

# Route Table Association
resource "aws_route_table_association" "demo_route_table_assoc" {
  subnet_id      = aws_subnet.demo_subnet.id
  route_table_id = aws_route_table.demo_route_table.id
}

# EC2 Instance Resource
resource "aws_instance" "demo_server" {
  ami           = "ami-053b12d3152c0cc71"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.demo_subnet.id
  key_name               = "demo-key"
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  tags = {
    Name = "demo-server"
  }

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF
}
