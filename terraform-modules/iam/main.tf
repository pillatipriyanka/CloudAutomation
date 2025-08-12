resource "aws_iam_policy" "custom" {
  name        = var.policy_name
  description = var.policy_description
  policy      = var.policy_document
  tags        = var.tags
}

resource "aws_iam_role" "custom" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "custom" {
  role       = aws_iam_role.custom.name
  policy_arn = aws_iam_policy.custom.arn
}