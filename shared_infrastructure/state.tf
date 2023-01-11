terraform {
 backend "s3" {
   bucket         = "srhoton-tfstate"
   key            = "b2c/shared.tfstate"
   region         = "us-west-2"
 }
}
