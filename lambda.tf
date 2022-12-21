module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my-lambda1"
  description   = "My awesome lambda function"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"
# if source code is stored locally. I can also be stored in S3 buckets. 
  source_path = "../src/lambda-function1"

  tags = {
    Name = "my-lambda1"
  }
}