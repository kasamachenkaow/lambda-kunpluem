resource "aws_dynamodb_table" "ddb_table" {
  name           = "TestTable"
  hash_key       = "id"
  billing_mode   = "PROVISIONED"
  read_capacity  = 2
  write_capacity = 2

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "example" {
  table_name = aws_dynamodb_table.ddb_table.name
  hash_key   = aws_dynamodb_table.ddb_table.hash_key

  item = <<ITEM
{
  "id": {"S": "01"},
  "price": {"N": "200"}
}
ITEM
}
