############
# S3 Bucket
############
resource "aws_s3_bucket" "state_store" {
  bucket = "rg-tf-wow-legion-server"
  acl    = "private"

  versioning {
    enabled = true
  }

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
    Name         = "tf-wow-legion-server"
    Description  = "Ragedunicorn WoW-Legion-Server S3 backend bucket"
    Environment  = "prod"
  }
}

############
# S3 Bucket
############
resource "aws_s3_bucket" "legion_data" {
  bucket = "rg-tf-wow-legion-data"
  acl    = "public-read"

  versioning {
    enabled = false
  }

  tags {
    Type         = "rg-generated"
    Organization = "ragedunicorn"
    Name         = "tf-wow-legion-data"
    Description  = "Ragedunicorn WoW-Legion-Server S3 data bucket"
    Environment  = "prod"
  }
}
