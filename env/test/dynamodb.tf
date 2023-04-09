resource "aws_dynamodb_table" "systemPhoneNumberConfig" {
  name           = "${var.environment}-systemPhoneNumberConfig"
  billing_mode   = "PAY_PER_REQUEST"
  stream_enabled = false
  hash_key       = "phoneNumber"

  attribute {
    name = "phoneNumber"
    type = "S"
  }

  tags = {
    Environment = var.environment
  }
}