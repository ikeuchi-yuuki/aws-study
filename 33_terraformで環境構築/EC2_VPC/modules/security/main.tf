# EC2用セキュリティグループ
resource "aws_security_group" "ec2_sg" {
  name        = "${var.my_env}-ec2-sg"
  description = "EC2 security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.my_env}-ec2-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.ec2_sg.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "${var.my_ip}/32"
  description       = "SSH from my IP"
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.ec2_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Allow all outbound traffic"
}
