provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  region                  = "us-east-1"
}


module "document_db_cluster" {
  source          = "../"
  enabled         = true
  name            = "test-doc-db"
  master_username = "testuser"
  master_password = var.master_password
  subnet_ids      = ["subnet-xxxx", "subnet-xxxx", "subnet-xxxx", ]

  storage_encrypted      = false
  vpc_security_group_ids = ["sg-xxx"]
  skip_final_snapshot    = true
  tags = {
    Environment  = "terraform-test"
    "created by" = "DevOps"
  }
}