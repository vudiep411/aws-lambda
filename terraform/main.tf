data "archive_file" "zip" {
    type = "zip"
    source_file = "../lambda/main.py"
    output_path = "lambda.zip"
}

resource "aws_lambda_function" "example_lambda" {
  function_name = "example-lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda.main.lambda_handler"
  runtime       = "python3.9"
  filename      = "${data.archive_file.zip.output_path}"

  source_code_hash = "${data.archive_file.zip.output_base64sha256}"
}


# lambda permission
resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.example_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = aws_api_gateway_rest_api.example_api.execution_arn
}