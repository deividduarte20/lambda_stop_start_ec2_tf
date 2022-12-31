resource "aws_cloudwatch_event_rule" "profile_stopec2_lambda_event_rule" {
  name                = "stopec2-lambda-event-rule"
  description         = "stopec2 scheduled cron"
  schedule_expression = lookup(var.sched_expr, "stop")
}

resource "aws_cloudwatch_event_target" "profile_gstopec2_lambda_target" {
  arn  = aws_lambda_function.lambda_stopec2.arn
  rule = aws_cloudwatch_event_rule.profile_stopec2_lambda_event_rule.name
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_stopec2_lambda" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_stopec2.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.profile_stopec2_lambda_event_rule.arn
}
