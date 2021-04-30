#Subnet
resource "aws_subnet" "ni-189027-subnet" {
  vpc_id                  = aws_vpc.ni-189027-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "ni-189027-subnet"
  }
}