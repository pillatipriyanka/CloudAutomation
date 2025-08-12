resource "aws_sfn_state_machine" "this" {
  name     = var.name
  role_arn = var.role_arn
  definition = file(var.definition_path)
}
