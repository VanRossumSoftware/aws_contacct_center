// *******************************************************************************************************
// getPhoneNumberConfig
// *******************************************************************************************************
data "archive_file" "getPhoneNumberConfig-archive" {
  type        = "zip"
  source_file = "../../src/lambdas/getPhoneNumberConfig.py"
  output_path = "getPhoneNumberConfig.zip"
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
  output_path = "getPrompts.zip"
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
