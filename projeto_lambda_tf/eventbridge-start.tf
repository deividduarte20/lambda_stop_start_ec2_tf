resource "aws_cloudwatch_event_rule" "profile_startec2_lambda_event_rule" {
  name                = "startec2-lambda-event-rule"
  description         = "startec2 scheduled cron"
  schedule_expression = lookup(var.sched_expr, "start")
}

resource "aws_cloudwatch_event_target" "profile_startec2_lambda_target" {
  arn  = aws_lambda_function.lambda_startec2.arn
  rule = aws_cloudwatch_event_rule.profile_startec2_lambda_event_rule.name
}

resource "aws_lambda_permission" "allow_cloudwatch_startec2_lambda" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_startec2.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.profile_startec2_lambda_event_rule.arn
}
