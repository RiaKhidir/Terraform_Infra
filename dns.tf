module "route53" {
  
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = "DemoAppACM"
  zone_id      = var.alb_acm_certificate_arn

  tags = {
    Environment = "Dev"
  }
}