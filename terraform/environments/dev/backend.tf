terraform {
  backend "s3" {
    bucket  = "godfred-cloudforge-ai-platform-tfstate"
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true

    use_lockfile   = true
    dynamodb_table = "cloudforge-ai-platform-tflock"
  }
}