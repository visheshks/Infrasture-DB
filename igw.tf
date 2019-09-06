resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
      Name          = "${var.project}_igw"
      Project       = "${var.project}"          
}
}
