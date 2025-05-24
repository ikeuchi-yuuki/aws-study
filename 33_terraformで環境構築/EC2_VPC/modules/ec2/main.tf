# ec2instance
data "aws_ssm_parameter" "al2023_latest" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "ec2" {
  ami                         = data.aws_ssm_parameter.al2023_latest.value
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet_1a_id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.my_env}-ec2"
  }
}

# セキュリティグループ
resource "aws_security_group" "ec2_sg" {
  name        = "${var.my_env}-ec2-sg"
  description = "EC2 Security Group"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }

  tags = {
    Name = "${var.my_env}-ec2-sg"
  }
}
