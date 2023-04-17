// *******************************************************************************************************
// getPhoneNumberConfig
// *******************************************************************************************************
data "archive_file" "getPhoneNumberConfig-archive" {
  type        = "zip"
  source_file = "../../src/lambdas/getPhoneNumberConfig.py"
  output_path = "lambaZips/getPhoneNumberConfig.zip"
}

resource "aws_lambda_function" "getPhoneNumberConfig-Lambda" {
  filename      = data.archive_file.getPhoneNumberConfig-archive.output_path
  function_name = "${var.environment}-getPhoneNumberConfig"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "getPhoneNumberConfig.lambda_handler"

  source_code_hash = data.archive_file.getPhoneNumberConfig-archive.output_base64sha256

  runtime = "python3.9"

  environment {
    variables = {
      DDB_TABLE_NAME = "${var.environment}-${var.phoneNumberConfigDDBName}"
    }
  }
}

resource "aws_cloudwatch_log_group" "getPhoneNumberConfig-cloudwatchGroup" {
  name              = "/aws/lambda/${aws_lambda_function.getPhoneNumberConfig-Lambda.function_name}"
  retention_in_days = 14
}

resource "aws_lambda_permission" "getPhoneNumberConfig-allowConnect" {
  statement_id  = "AllowExecutionFromConnect"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.getPhoneNumberConfig-Lambda.function_name
  principal     = "connect.amazonaws.com"
  source_arn    = var.connectInstanceARN
}

// *******************************************************************************************************
// getPrompts
// *******************************************************************************************************
data "archive_file" "getPrompts-archive" {
  type        = "zip"
  source_file = "../../src/lambdas/getPrompts.py"
  output_path = "lambaZips/getPrompts.zip"
}

resource "aws_lambda_function" "getPrompts-Lambda" {
  filename      = data.archive_file.getPrompts-archive.output_path
  function_name = "${var.environment}-getPrompts"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "getPrompts.lambda_handler"

  source_code_hash = data.archive_file.getPrompts-archive.output_base64sha256

  runtime = "python3.9"

  environment {
    variables = {
      DDB_TABLE_NAME = "${var.environment}-${var.promptDDBName}"
    }
  }
}

resource "aws_cloudwatch_log_group" "getPrompts-cloudwatchGroup" {
  name              = "/aws/lambda/${aws_lambda_function.getPrompts-Lambda.function_name}"
  retention_in_days = 14
}

resource "aws_lambda_permission" "getPrompts-allowConnect" {
  statement_id  = "AllowExecutionFromConnect"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.getPrompts-Lambda.function_name
  principal     = "connect.amazonaws.com"
  source_arn    = var.connectInstanceARN
}

// *******************************************************************************************************
// writePayment
// *******************************************************************************************************
data "archive_file" "writePayment-archive" {
  type        = "zip"
  source_file = "../../src/lambdas/writePayment.py"
  output_path = "lambaZips/writePayment.zip"
}

resource "aws_lambda_function" "writePayment-Lambda" {
  filename      = data.archive_file.writePayment-archive.output_path
  function_name = "${var.environment}-writePayment"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "writePayment.lambda_handler"

  source_code_hash = data.archive_file.writePayment-archive.output_base64sha256

  runtime = "python3.9"

  environment {
    variables = {
      DDB_TABLE_NAME = "${var.environment}-${var.paymentHistoryDDBName}"
    }
  }
}

resource "aws_cloudwatch_log_group" "writePayment-cloudwatchGroup" {
  name              = "/aws/lambda/${aws_lambda_function.writePayment-Lambda.function_name}"
  retention_in_days = 14
}

resource "aws_lambda_permission" "writePayment-allowConnect" {
  statement_id  = "AllowExecutionFromConnect"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.writePayment-Lambda.function_name
  principal     = "connect.amazonaws.com"
  source_arn    = var.connectInstanceARN
}

// *******************************************************************************************************
// getRecentPayment
// *******************************************************************************************************
data "archive_file" "getRecentPayment-archive" {
  type        = "zip"
  source_file = "../../src/lambdas/getRecentPayment.py"
  output_path = "lambaZips/getRecentPayment.zip"
}

resource "aws_lambda_function" "getRecentPayment-Lambda" {
  filename      = data.archive_file.getRecentPayment-archive.output_path
  function_name = "${var.environment}-getRecentPayment"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "getRecentPayment.lambda_handler"

  source_code_hash = data.archive_file.getRecentPayment-archive.output_base64sha256

  runtime = "python3.9"

  environment {
    variables = {
      DDB_TABLE_NAME = "${var.environment}-${var.paymentHistoryDDBName}"
    }
  }
}

resource "aws_cloudwatch_log_group" "getRecentPayment-cloudwatchGroup" {
  name              = "/aws/lambda/${aws_lambda_function.getRecentPayment-Lambda.function_name}"
  retention_in_days = 14
}

resource "aws_lambda_permission" "getRecentPayment-allowConnect" {
  statement_id  = "AllowExecutionFromConnect"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.getRecentPayment-Lambda.function_name
  principal     = "connect.amazonaws.com"
  source_arn    = var.connectInstanceARN
}
