module "iam_iam-user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "6.8.2"
  name = "sudhanshugfg48-new-user"
}

module "iam_policy" {
  source = "terraform-aws-modules/iam/aws//modules/iam-policy"

  name_prefix = "gfg-example-policy"
  path        = "/"
  description = "My gfg iam policy"

  policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": [
            "ec2:Describe*"
          ],
          "Effect": "Allow",
          "Resource": "*"
        }
      ]
    }
  EOF
}

module "s3-bucket_example_object" {
  source  = "terraform-aws-modules/s3-bucket/aws//modules/object"
  version = "5.17.0"

  bucket      = "gfg48"
  key         = "gfg-demo/var.tf"
  file_source = "${path.module}/var.tf"

  source_hash = filemd5("${path.module}/var.tf")
}