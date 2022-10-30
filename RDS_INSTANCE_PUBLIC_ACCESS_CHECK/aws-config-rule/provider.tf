provider "aws" {
  region                   = var.region
  shared_credentials_files = ["C:\\Users\\test1\\.aws\\credentials"]
  profile                  = "test"
}