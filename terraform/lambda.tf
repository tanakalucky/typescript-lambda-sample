data "archive_file" "typescript_lambda_sample" {
  type        = "zip"
  source_dir  = "../dist"
  output_path = "../typescript_lambda_sample.zip"
}

resource "aws_lambda_function" "typescript_lambda_sample" {
  function_name    = "typescript_lambda_sample"
  filename         = data.archive_file.typescript_lambda_sample.output_path
  source_code_hash = data.archive_file.typescript_lambda_sample.output_base64sha256
  runtime          = "nodejs20.x"
  role             = aws_iam_role.lambda_iam_role.arn
  handler          = "index.handler"
}
