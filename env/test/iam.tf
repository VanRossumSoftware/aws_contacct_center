resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "lambda_logging" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"
  policy      = data.aws_iam_policy_document.lambda_logging.json
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

resource "aws_iam_policy" "lambda_ddb_read_access" {
  name        = "lambda_ddb_read_access"
  description = "Allows Lambda function to read from a specific DynamoDB table"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = [
          "dynamodb:GetItem",
          "dynamodb:Query",
          "dynamodb:Scan"
        ]
        Resource  = [
          "arn:aws:dynamodb:${var.region}:${var.accountNumber}:table/${var.environment}-${var.phoneNumberConfigDDBName}",
          "arn:aws:dynamodb:${var.region}:${var.accountNumber}:table/${var.environment}-${var.promptDDBName}",
          "arn:aws:dynamodb:${var.region}:${var.accountNumber}:table/${var.environment}-${var.paymentHistoryDDBName}"
        ]
      },
      {
        Effect    = "Allow"
        Action    = [
          "dynamodb:PutItem"
        ]
        Resource  = [
          "arn:aws:dynamodb:${var.region}:${var.accountNumber}:table/${var.environment}-${var.paymentHistoryDDBName}"
        ]
      }
    ]   
  })
}

resource "aws_iam_role_policy_attachment" "lambda-ddb-read-access" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_ddb_read_access.arn
}