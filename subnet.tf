resource "aws_subnet" "subnet_dmz" {
  availability_zone = "${var.aws_region}${var.availability-zones[0]}"
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.cidr_block["dmz"]}"

  tags = {
      Name          = "${var.project}_subnet_DMZ"
      Project       = "${var.project}"          
  }
}

resource "aws_subnet" "subnet_database" {
  availability_zone = "${var.aws_region}${var.availability-zones[0]}"
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.cidr_block["database"]}"

  tags = {
      Name          = "${var.project}_subnet_database"
      Project       = "${var.project}"          
  }
}
