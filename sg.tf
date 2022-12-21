module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name = "DemoInfraSGForWebTraffic"
  description = "Allow web traffic from our networks"
  vpc_id = module.vpc.vpc_id
  tags = {
    Environment = "Development"
    Owner = "Ria"
  }
  egress = [
    {
      description = "Allow all agress"
      from_port = 0
      to_port = 0
      protocol - "-1"
      cidr-blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      security_groups = []
      prefix_list_ids = []
      self = false
    }
  ]
  ingress = [
    {
      description = "Allow 80 ingress"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = var.trusted_netblocks
      security_group_id - aws_security_group.allow_web.id    ====
    }
  ]
  ingress = [
    {
      description = "Allow 443 ingress"
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = var.trusted_netblocks
      security_group_id - aws_security_group.allow_web.id   ====
    }
  ]
  ingress = [
    {
      description = "Allow 443 ingress from Lambda"
      from_port = 443
      to_port = 443
      protocol = "tcp"
      source_security_group_id = aws_security_group.lambda_sg.id   ==== 
      security_group_id - aws_security_group.allow_web.id     ====
    }
  ]
}

module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name = "DemoInfraSGforRDS-DB"
  description = "Allow traffic to database instance"
  vpc_id = module.vpc.vpc_id
  tags = {
    Environment = "Development"
    Owner = "Ria"
  }
  egress = [
    {
      description = "Allow all agress"
      from_port = 0
      to_port = 0
      protocol - "-1"
      cidr-blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      security_groups = []
      prefix_list_ids = []
      self = false
    }
  ]
  ingress = [
    {
      description = "Allow RDS Access"
      from_port = var.rds_db_port
      to_port = var.rds_db_port
      protocol = "tcp"
      cidr_blocks = var.vpc_private_subnets
      security_group_id - aws_security_group.allow_rds.id   ====
    }
  ]
  ingress = [
    {
      description = "Allow ECS to RDS Access"
      from_port = var.rds_db_port
      to_port = var.rds_db_port
      protocol = "tcp"
      source_security_group_id = aws_security_group.ecs_task_sg.id   ==== 
      security_group_id - aws_security_group.allow_rds.id     ====
    }
  ]
}

module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name = "DemoInfraSGforLambda"
  description = "Attach to Lambda, act as source SG for other rules"
  vpc_id = module.vpc.vpc_id
  tags = {
    Environment = "Development"
    Owner = "Ria"
  }
  egress = [
    {
      description = "Allow all agress"
      from_port = 0
      to_port = 0
      protocol - "-1"
      cidr-blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      security_groups = []
      prefix_list_ids = []
      self = false
    }
  ]
}

module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name = "DemoInfraSGforLambda"
  description = "Attach to Lambda, act as source SG for other rules"
  vpc_id = module.vpc.vpc_id
  tags = {
    Environment = "Development"
    Owner = "Ria"
  }
  egress = [
    {
      description = "Allow all agress"
      from_port = 0
      to_port = 0
      protocol - "-1"
      cidr-blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      security_groups = []
      prefix_list_ids = []
      self = false
    }
  ]
}

module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name = "DemoInfraSGforECSTask"
  description = "Attach to ECS, provide source SG for other rules"
  vpc_id = module.vpc.vpc_id
  tags = {
    Environment = "Development"
    Owner = "Ria"
  }
  egress = [
    {
      description = "Allow all agress"
      from_port = 0
      to_port = 0
      protocol - "-1"
      cidr-blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      security_groups = []
      prefix_list_ids = []
      self = false
    }
  ]
  ingress = [
    {
      description = "Allow ALB to ECS"
      from_port = var.alb_target_group_port
      to_port = var.alb_target_group_port
      protocol = "tcp"
      source_security_group_id = aws_security_group.alb_sg.id   ==== 
      security_group_id - aws_security_group.ecs_task_sg.id     ====
    }
  ]
}

module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name = "DemoInfraSGforALB"
  description = "Attach to ALB, act as source SG for other rules"
  vpc_id = module.vpc.vpc_id
  tags = {
    Environment = "Development"
    Owner = "Ria"
  }
  egress = [
    {
      description = "Allow all agress"
      from_port = 0
      to_port = 0
      protocol - "-1"
      cidr-blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      security_groups = []
      prefix_list_ids = []
      self = false
    }
  ]
}