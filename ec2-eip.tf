resource "aws_eip" "nat-gw" {

           vpc        =    true

           tags = {
              Name          = "${var.project}_ngw_eip"
              Project       = "${var.project}"          
           }
}


resource "aws_eip" "nginx" {

          instance                   =  "${aws_instance.nginx.id}"
          associate_with_private_ip  =  "${var.private_ip["nginx"]}"
          vpc                        =  true

          tags = {
              Name          = "${var.project}_nginx_eip"
              Project       = "${var.project}"          
          }
  }




