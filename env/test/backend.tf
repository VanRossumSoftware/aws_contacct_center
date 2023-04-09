terraform {
  backend "s3" {
    bucket = "bradvr-terraform-state-files"
    key    = "arn:aws:kms:us-east-1:130618378039:alias/aws/s3"
    region = "us-east-1"
  }
}
