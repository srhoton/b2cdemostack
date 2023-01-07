resource "aws_ecr_repository" "b2c_repository" {
  name = "b2c_repository"
  tags = {
    Name = "b2c_repository"
  }
}
