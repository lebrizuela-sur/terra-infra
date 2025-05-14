resource "aws_lambda_function" "default" {
  function_name = var.function_name
  role          = var.role_arn
  runtime       = var.runtime
  handler       = var.handler
  filename      = var.filename
  source_code_hash = filebase64sha256(var.filename)
  memory_size = 512
  timeout     = 60
  environment { variables = { ENV = "prd" } }
  layers = var.layers
}
