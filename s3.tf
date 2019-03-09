############
# S3 Bucket
############
resource "aws_s3_bucket" "legion_backup" {
  bucket = "rg-tf-wow-legion-backup"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags {
    Type         = "rg-generated"
    Organization = "ragedunicorn"
    Name         = "tf-wow-legion-backup"
    Description  = "Ragedunicorn WoW-Legion-Server S3 backup bucket"
    Environment  = "prod"
  }
}
