# wow-legion-server

> Module for wow-legion-server

A module for creating the basic resources such as S3 bucket for storing terraform state and IAM users.

## Link

[tf-aws-wow-legion-server](https://github.com/RagedUnicorn/tf-aws-wow-legion-server)

## Inputs

| Name       | Description        | Type   | Default        | Required |
|------------|--------------------|--------|----------------|----------|
| access_key | The AWS access key | string | -              | yes      |
| aws_region | AWS region         | string | `eu-central-1` | no       |
| secret_key | The AWS secret key | string | -              | yes      |

## Outputs

#### S3 Bucket

```
terraform {
  backend "s3" {
    bucket = "rg-tf-wow-legion-server"
    key    = "wow-legion-server.terraform.tfstate"
    region = "eu-central-1"
  }
}
```

| Name               | Description                            |
|--------------------|----------------------------------------|
| id                 | ID of the created bucket               |
| arn                | The ARN of the bucket.                 |
| bucket_domain_name | The bucket domain name.                |
| region             | The AWS region this bucket resides in. |

#### IAM deployer user

`rg_cli_tf_wow_legion_server_deployer`

| Name               | Description                            |
|--------------------|----------------------------------------|
| arn                | The ARN assigned by AWS for this user. |
| name               | The user's name.                       |
| unique_id          | The unique ID assigned by AWS.         |
| access_key         | The AWS access key.                    |
| secret_key         | The AWS secret key.                    |
