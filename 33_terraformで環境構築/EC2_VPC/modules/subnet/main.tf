# サブネット関連（パブリック2、プライベート２）
resource "aws_subnet" "public_1a" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.azs[0]
  tags = {
    Name = "${var.my_env}-public-subnet-1a"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.azs[1]
  tags = {
    Name = "${var.my_env}-public-subnet-1c"
  }
}

resource "aws_subnet" "private_1a" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.3.0/24"
  availability_zone = var.azs[0]
  tags = {
    Name = "${var.my_env}-private-subnet-1a"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.4.0/24"
  availability_zone = var.azs[1]
  tags = {
    Name = "${var.my_env}-private-subnet-1c"
  }
}

# ルートテーブルと関連付け
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.my_env}-rtb-public"
  }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_1c.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.my_env}-rtb-private"
  }
}

resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_1c" {
  subnet_id      = aws_subnet.private_1c.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}
