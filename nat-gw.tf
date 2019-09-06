resource "aws_nat_gateway" "ngw" {
  allocation_id = "${aws_eip.nat-gw.id}"
  subnet_id     = "${aws_subnet.subnet_dmz.id}"
  depends_on    = ["aws_internet_gateway.igw"]

  tags = {
            Name     = "${var.project}_nat_gateway"
            Project  = "${var.project}"
  }
}
