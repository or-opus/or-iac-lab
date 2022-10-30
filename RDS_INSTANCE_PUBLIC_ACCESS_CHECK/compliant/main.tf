#Subnets of RDS
resource "aws_db_subnet_group" "default" {
  name       = "${var.projectname}_db_subnet_group"
  subnet_ids = [aws_subnet.subnet-1.id, aws_subnet.subnet-2.id]

  tags = {
    Name = "${var.projectname}_db_subnet_group"
  }
}

#RDS
resource "aws_db_instance" "default" {
  allocated_storage       = var.disk_size
  storage_type            = var.storage_type
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_size
  db_name                 = var.db_name
  username                = var.dbuser
  password                = var.dbpassword
  backup_retention_period = 7
  identifier              = "${var.projectname}-rds-server"
  publicly_accessible     = "false" //Chage is to false
  skip_final_snapshot     = "true"
  db_subnet_group_name    = aws_db_subnet_group.default.name
}
