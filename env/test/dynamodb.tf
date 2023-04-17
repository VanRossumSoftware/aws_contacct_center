resource "aws_dynamodb_table" "systemPhoneNumberConfig" {
  name           = "${var.environment}-${var.phoneNumberConfigDDBName}"
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

resource "aws_dynamodb_table" "prompts" {
  name           = "${var.environment}-${var.promptDDBName}"
  billing_mode   = "PAY_PER_REQUEST"
  stream_enabled = false
  hash_key       = "contactFlowName"
  range_key      = "promptId"

  attribute {
    name = "contactFlowName"
    type = "S"
  }

  attribute {
    name = "promptId"
    type = "S"
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_dynamodb_table" "paymentHistory" {
  name           = "${var.environment}-${var.paymentHistoryDDBName}"
  billing_mode   = "PAY_PER_REQUEST"
  stream_enabled = false
  hash_key       = "paymentId"
  range_key      = "accountNumber"

  attribute {
    name = "paymentId"
    type = "S"
  }

  attribute {
    name = "accountNumber"
    type = "S"
  }

  tags = {
    Environment = var.environment
  }
}
