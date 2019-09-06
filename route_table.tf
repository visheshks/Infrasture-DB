resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
         cidr_block = "0.0.0.0/0"
         gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    	  Name     = "${var.project}_igw_route"
          Project  = "${var.project}"
  }
}

resource "aws_route_table_association" "public_rt" {
          subnet_id = "${aws_subnet.subnet_dmz.id}"
          route_table_id = "${aws_route_table.public_rt.id}"
    }

resource "aws_route_table_association" "public_rt_sftp" {
          subnet_id = "${aws_subnet.subnet_dmz.id}"
          route_table_id = "${aws_route_table.public_rt.id}"
    }

resource "aws_route_table" "private_rt" {
        vpc_id = "${aws_vpc.main.id}"

   route {
            cidr_block = "0.0.0.0/0"
            gateway_id = "${aws_nat_gateway.ngw.id}"
    }

   tags {
            Name     = "${var.project}_ngw_route"
            Project  = "${var.project}"
     }
}


resource "aws_route_table_association" "private_rt2" {
          subnet_id = "${aws_subnet.subnet_database.id}"
          route_table_id = "${aws_route_table.private_rt.id}"
    }


