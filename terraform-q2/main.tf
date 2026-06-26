data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

resource "aws_security_group" "backend_sg" {
  name = "backend-sg"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "frontend_sg" {
  name = "frontend-sg"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "backend" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [aws_security_group.backend_sg.id]

  user_data = file("${path.module}/backend_userdata.sh")

  tags = {
    Name="Backend-EC2"
  }

}

resource "aws_instance" "frontend" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [aws_security_group.frontend_sg.id]

  user_data = replace(file("${path.module}/frontend_userdata.sh"),"BACKEND_PRIVATE_IP",aws_instance.backend.private_ip)

  depends_on=[aws_instance.backend]

  tags = {
    Name="Frontend-EC2"
  }

}