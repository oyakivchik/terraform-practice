module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = var.key_name
  public_key = var.public_key
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = { for idx, instance in var.instance_dict : idx => instance }

  name = each.value.name

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = module.key_pair.key_pair_name
  vpc_security_group_ids = [module.web_server_sg.security_group_id]
  subnet_id              = module.network.private_subnets[each.value.subnet_id]

  tags = {
    Terraform   = "true"
    Environment = "stage"
    Type        = "web"
  }
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = var.alb_name

  load_balancer_type = "application"

  vpc_id          = module.network.vpc_id
  subnets         = module.network.public_subnets
  security_groups = [module.lb_sg.security_group_id]

  target_groups = [
    {
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target_1 = {
          target_id = module.ec2_instance[0].id
          port      = 80
        },
        my_target_2 = {
          target_id = module.ec2_instance[1].id
          port      = 80
        },
        my_target_3 = {
          target_id = module.ec2_instance[2].id
          port      = 80
        }
      }
      target_group_tags = {
        Type = "web"
      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "stage"
  }
}