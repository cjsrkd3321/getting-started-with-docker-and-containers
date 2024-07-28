data "aws_vpc" "this" {}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "this" {
  filename        = "${path.module}/rex.pem"
  content         = tls_private_key.this.private_key_pem
  file_permission = "0400"
}

resource "aws_key_pair" "this" {
  key_name   = "rex.pem"
  public_key = tls_private_key.this.public_key_openssh
}

resource "aws_security_group" "this" {
  name   = "allow-ssh"
  vpc_id = data.aws_vpc.this.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_instance_profile" "this" {
  name = "docker-cicd-ec2-instance-profile"
  role = aws_iam_role.this.name
}

resource "aws_iam_role" "this" {
  name = "docker-cicd-ec2-role"
  path = "/"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
}

resource "aws_instance" "this" {
  ami                    = "ami-045f2d6eeb07ce8c0"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.this.id]
  iam_instance_profile   = aws_iam_instance_profile.this.name

  user_data = <<EOT
#!/bin/bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
EOT
}

resource "aws_ecr_repository" "this" {
  name         = "this"
  force_delete = true
}