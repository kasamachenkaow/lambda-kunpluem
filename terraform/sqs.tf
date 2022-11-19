resource "aws_sqs_queue" "dlq_queue" {
  name = "dlq-queue"
}

resource "aws_sqs_queue" "input_queue" {
  name                      = "input-queue"
  max_message_size          = 2048
  message_retention_seconds = 86400
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq_queue.arn
    maxReceiveCount     = 1
  })
}
