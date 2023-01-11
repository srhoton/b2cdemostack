variable "az_mapping" {
  description = "AZ names to their zones"
  default = {
    "private-1" = "us-west-2a"
    "private-2" = "us-west-2b"
    "private-3" = "us-west-2c"
    "public-1" = "us-west-2a"
    "public-2" = "us-west-2b"
    "public-3" = "us-west-2c"

  }
}
