variable "aws_region" {
  type = string 
  default = "us-east-2"
}

variable "vpc_cidr" {
  type = string 
  #default = "10.0.0.0/16"
}

variable "aws_azs" {
  type = list(string)
  default = ["us-east-2a", "eu-east-2b", "eu-east-2c"]

}

variable "private_subnets" {
  type = list(string) 
}

variable "public_subnets" {
  type = list(string) 
}

variable "vpc_database_subnets" {
  type = list(string) 
}

variable "alb_enable_deletion_protection" {
  type = bool 
  default = false
}

variable "alb_acm_certificate_arn" {
  type = string
}

variable "trusted_netblocks" {
  type = list(string)
}

variable "rds_db_port" {
  type = string 
  default = "5432"
}

variable "alb_target_group_port" {
  type = string
  default = "8080"
}

variable "create_vpc" {
  type = bool
  default = true
}