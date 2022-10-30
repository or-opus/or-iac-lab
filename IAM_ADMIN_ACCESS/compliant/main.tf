resource "aws_iam_user" "user" {
  name          = var.user-name
  force_destroy = true

  tags = {
    user = var.user-name
  }
}

data "aws_iam_policy" "admin-policy" {
  name = "SupportUser" //Use a relevant role based access policy rather than giving full access control
}

resource "aws_iam_policy_attachment" "policy-attach" {
  name       = "${var.user-name}_policy"
  users      = [aws_iam_user.user.name]
  policy_arn = data.aws_iam_policy.admin-policy.arn
}

