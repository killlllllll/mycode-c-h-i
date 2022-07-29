terraform {
  backend "s3" {
    bucket = "coffeebucket270626"
    key    = "terraform/state"
  }
}
