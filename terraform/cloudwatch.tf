//rule to trigger SNS
resource "aws_cloudwatch_event_rule" "publish-sns-rule" {
  name = "publish-sns-rule"
  schedule_expression = "rate(1 minute)"
}

//cloud watch event targets SNS
resource "aws_cloudwatch_event_target" "sns-publish" {
  target_id = "SendToSNS"
  rule = aws_cloudwatch_event_rule.publish-sns-rule.name
  arn = aws_sns_topic.test-sns.arn

  input = jsonencode({ "first_name": "Homero", "last_name": "Simpsons"})

}