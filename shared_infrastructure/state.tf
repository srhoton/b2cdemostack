terraform {
 backend "s3" {
   bucket         = "b2c-tfstate"
   key            = "b2c/shared.tfstate"
   region         = "us-west-2"
 }
}
