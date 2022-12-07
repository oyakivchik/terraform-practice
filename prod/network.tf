module "network" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = var.name

  cidr = var.cidr
  azs  = var.azs

  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
}

module "web_server_sg" {
  source      = "terraform-aws-modules/security-group/aws"
  name        = "web-server-sg"
  description = "Security group for the web server"
  vpc_id      = module.network.vpc_id

  ingress_with_cidr_blocks = [
    {
      rule        = "http-80-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

module "db_sg" {
  source      = "terraform-aws-modules/security-group/aws"
  name        = "db-sg"
  description = "Security group for the DB server"
  vpc_id      = module.network.vpc_id

  ingress_cidr_blocks = module.network.private_subnets_cidr_blocks
  ingress_rules       = ["mysql-tcp"]

}

module "lb_sg" {
  source      = "terraform-aws-modules/security-group/aws"
  name        = "web-server-sg"
  description = "Security group for the web server"
  vpc_id      = module.network.vpc_id

  ingress_with_cidr_blocks = [
    {
      rule        = "http-80-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      rule        = "https-443-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}