# RDSインスタンス
resource "aws_db_instance" "rds" {
  identifier              = "${var.my_env}-rds"
  engine                  = "mysql"
  engine_version          = "8.0.39"
  instance_class          = "db.t4g.micro"
  allocated_storage       = 20
  storage_type            = "gp2"
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.rds_db.name
  vpc_security_group_ids  = [var.rds_sg_id]
  username                = var.db_username
  manage_master_user_password = true # シークレットマネージャー利用
  backup_retention_period = 1
  db_name                 = "awsstudy"
  monitoring_interval     = 60
  monitoring_role_arn     = aws_iam_role.rds_monitoring.arn
  parameter_group_name    = aws_db_parameter_group.rds_parameter.name
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
  storage_encrypted       = true
  auto_minor_version_upgrade = true
  skip_final_snapshot     = true
  tags = {
    Name = "${var.my_env}-rds"
  }
}

# RDSサブネットグループ
resource "aws_db_subnet_group" "rds_db" {
  name       = "${var.my_env}-db-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags = {
    Name = "${var.my_env}-db-subnet-group"
  }
}

# RDSパラメータグループ
resource "aws_db_parameter_group" "rds_parameter" {
  name   = "${var.my_env}-rds-parameter-group"
  family = "mysql8.0"
  description = "${var.my_env}-rds-parameter-group"
  parameter {
    name  = "general_log"
    value = "1"
  }
  parameter {
    name  = "slow_query_log"
    value = "1"
  }
  parameter {
    name  = "long_query_time"
    value = "2"
  }
  parameter {
    name  = "log_output"
    value = "FILE"
  }
  tags = {
    Name = "${var.my_env}-rds-parameter-group"
  }
}

# Enhanced Monitoring IAMロール
data "aws_iam_policy_document" "rds_monitoring" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}
resource "aws_iam_role" "rds_monitoring" {
  name               = "${var.my_env}-rds-monitoring-role"
  assume_role_policy = data.aws_iam_policy_document.rds_monitoring.json
}
resource "aws_iam_role_policy_attachment" "rds_monitoring" {
  role       = aws_iam_role.rds_monitoring.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}
