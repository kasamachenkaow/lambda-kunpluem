resource "aws_iam_role_policy" "lambda_service" {
  name   = "lambda-service-policy"
  role   = aws_iam_role.iam_for_lambda.name
  policy = data.aws_iam_policy_document.lambda_service.json
}

data "aws_iam_policy_document" "lambda_service" {
  statement {
    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:SendMessage"
    ]
    resources = [
      aws_sqs_queue.input_queue.arn
    ]
  }

  statement {
    actions = [
      "dynamodb:Query"
    ]
    resources = [
      aws_dynamodb_table.ddb_table.arn
    ]
  }
}
