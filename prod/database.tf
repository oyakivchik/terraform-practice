module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = var.identifier

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage

  db_name  = var.db_name
  username = var.username
  port     = var.port


  vpc_security_group_ids = [module.db_sg.security_group_id]

  tags = {
    Owner       = "user"
    Environment = "prod"
  }

  # DB subnet group
  create_db_subnet_group = false
  db_subnet_group_name   = module.network.database_subnet_group_name
  subnet_ids             = module.network.database_subnets

  # DB parameter group
  family = var.family

  # DB option group
  major_engine_version = var.major_engine_version

  # Database Deletion Protection
  deletion_protection = var.deletion_protection

  parameters = var.parameters

}