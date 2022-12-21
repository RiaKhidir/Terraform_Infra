module "log_metric_filter" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-metric-filter"
  version = "~> 3.0"

  log_group_name = "my-application-logs"

  name    = "error-metric"
  pattern = "ERROR"

  metric_transformation_namespace = "MyApplication"
  metric_transformation_name      = "ErrorCount"
}

module "cloudtrail" {
  source = "cloudposse/cloudtrail/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version     = "x.x.x"
  namespace                     = "eg"
  stage                         = "dev"
  name                          = "cluster"
  enable_log_file_validation    = true
  include_global_service_events = true
  is_multi_region_trail         = false
  enable_logging                = true
  s3_bucket_name                = "my-cloudtrail-logs-bucket"
}