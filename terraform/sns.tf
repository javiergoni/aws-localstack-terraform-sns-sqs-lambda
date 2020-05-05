resource "aws_sns_topic" "test-sns" {
  name = "test-sns"
}

#https://www.terraform.io/docs/providers/aws/r/sns_topic_policy.html
resource "aws_sns_topic_policy" "default" {
  arn = aws_sns_topic.test-sns.arn

  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {

  statement {
    sid       = "Allow CloudwatchEvents"
    actions   = ["sns:Publish"]
    resources = [aws_sns_topic.test-sns.arn]
    
    effect = "Allow"

    principals {
      #type        = "Service"
      #identifiers = ["events.amazonaws.com"]
      type         = "AWS"
      identifiers  = ["*"]
    }
  }
}