resource "aws_iam_role" "roleA" {
  name = "roleA"
  provider = aws.account_a

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "sts:AssumeRole"
        }
    ]
})

  inline_policy {
    name = "iam_deny_policy"

    policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        },
        {
            "Effect": "Deny",
            "Action": [
                "iam:*"
            ],
            "Resource": "*"
        }
    ]
})
  }
}

resource "aws_iam_role" "roleC" {
  name = "roleC"
  provider = aws.account_b

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::053146050864:root"
            },
            "Action": "sts:AssumeRole",
            "Condition": {}
        }
    ]
})

  inline_policy {
    name = "s3_full_permission"

    policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets"
            ],
            "Resource": "arn:aws:s3:::*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::aws-test-bucket-sheezan/*",
                "arn:aws:s3:::aws-test-bucket-sheezan"
            ]
        }
    ]
})
  }
}

resource "aws_iam_role" "roleB" {
  name = "roleB"
  provider = aws.account_a

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "sts:AssumeRole"
        }
    ]
})

inline_policy {
    name = "assume_roleC"

    policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": [
                "arn:aws:iam::437364241743:role/roleC"
            ]
        }
    ]
})
  }
}
