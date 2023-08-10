output "api_endpoint" {
  value = aws_api_gateway_rest_api.example_api.invoke_url
}