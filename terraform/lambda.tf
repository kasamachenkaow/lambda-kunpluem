resource "aws_lambda_function" "test_lambda" {
  filename      = "../handler.zip"
  function_name = "hello_function"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "handler.hello"

  source_code_hash = filebase64sha256("../handler.zip")

  runtime = "nodejs16.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
