#VPC
resource "aws_vpc" "ni-189027-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ni-189027-vpc"
  }
}