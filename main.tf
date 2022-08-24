provider "aws" {
  region = "us-east-1"
  access_key = "AKIAT3TJLN44J7FDVWOD"
  secret_key = "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"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#iam policy for logging for a lambda

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

#policy attechment on the role

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

#Generates an archive from content, a file, or a directory of file

data "archive_file" "zip_the_python_code" {
    type = "zip"
    source_dir = "${path.module}/python/"
    output_path = "${path.module}/python/hellp-python.zip"
}

#create a lambda fucntion
#in terraform ${path.module} is the current directory

resource "aws_lambda_function" "test_lambda" {
  filename      = "${path.module}/python/hellp-python.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "hello-python.lambda_handler"
  depends_on = [aws_iam_role_policy_attachment.lambda_logs]
  runtime = "python3.8"

}

output "iam_for_lambda_output" {
    value = aws_iam_role.iam_for_lambda.name
}

output "aws_role_arn_output" {
    value = aws_iam_role.iam_for_lambda.arn
}

output "logging_arn_output" {
    value = aws_iam_policy.lambda_logging.arn
}