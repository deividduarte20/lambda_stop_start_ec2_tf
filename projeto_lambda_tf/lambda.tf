data "archive_file" "lambda_startec2" {
  type        = "zip"
  source_file = "./lambda/startec2.py"
  output_path = "startec2.zip"
}

data "archive_file" "lambda_stopec2" {
  type        = "zip"
  source_file = "./lambda/stopec2.py"
  output_path = "stopec2.zip"
}

# Criando os lambdas
resource "aws_lambda_function" "lambda_startec2" {
  filename         = data.archive_file.lambda_startec2.output_path
  function_name    = "${var.project}-startec2"
  role             = aws_iam_role.cloudprotegida-ec2-lambda-role-stopstart.arn
  runtime          = "python3.9"
  timeout          = var.lambda_timeout
  handler          = "startec2.lambda_handler"
  tags             = var.tags
  source_code_hash = filebase64sha256(data.archive_file.lambda_startec2.output_path)
  environment {
    variables = {
      TARGET_TAG_KEY   = lookup(var.lambda_env, "KEY")
      TARGET_TAG_VALUE = lookup(var.lambda_env, "VALUE")
    }
  }
}

resource "aws_lambda_function" "lambda_stopec2" {
  filename         = data.archive_file.lambda_stopec2.output_path
  function_name    = "${var.project}-stopec2"
  role             = aws_iam_role.cloudprotegida-ec2-lambda-role-stopstart.arn
  runtime          = "python3.9"
  timeout          = var.lambda_timeout
  handler          = "stopec2.lambda_handler"
  tags             = var.tags
  source_code_hash = filebase64sha256(data.archive_file.lambda_stopec2.output_path)
  environment {
    variables = {
      TARGET_TAG_KEY   = lookup(var.lambda_env, "KEY")
      TARGET_TAG_VALUE = lookup(var.lambda_env, "VALUE")
    }
  }
}
