resource "aws_iam_group" "group1" {
  name = var.group_1
  provider = aws.account_a
}

resource "aws_iam_group" "group2" {
  name = var.group_2
  provider = aws.account_a
}

resource "aws_iam_user" "iam_with_cli" {
  for_each = local.iam_with_cli
  provider = aws.account_a
  name     = each.value.name
  path     = "/"

  tags = {
    Name = each.value.name
  }
}

resource "aws_iam_access_key" "cli_access" {
  for_each = local.iam_with_cli
  provider = aws.account_a
  user     = aws_iam_user.iam_with_cli[each.key].name
}
resource "aws_iam_user" "iam_full_access" {
  for_each = local.iam_full_access
  provider = aws.account_a
  name     = each.value.name
  path     = "/"

  tags = {
    Name = each.value.name
  }
}

resource "aws_iam_user_login_profile" "full_access" {
  for_each                = local.iam_full_access
  provider = aws.account_a
  user                    = aws_iam_user.iam_full_access[each.key].name
}

resource "aws_iam_user_group_membership" "group2-full-access" {
  provider = aws.account_a
  for_each = local.iam_full_access
  user = aws_iam_user.iam_full_access[each.key].name

  groups = [
    aws_iam_group.group2.name
  ]
}

resource "aws_iam_user_group_membership" "group1-cli-access" {
  provider = aws.account_a
  for_each = local.iam_with_cli
  user = aws_iam_user.iam_with_cli[each.key].name

  groups = [
    aws_iam_group.group1.name
  ]
}