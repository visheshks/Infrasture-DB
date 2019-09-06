resource "aws_instance" "nginx" {
  ami                         = "${var.centos_ami_id["${var.aws_region}"]}"
  instance_type               = "${var.instance_type["nginx"]}"
  key_name                    = "${aws_key_pair.nginx.id}"
  monitoring                  = true
  associate_public_ip_address = true
  private_ip                  = "${var.private_ip["nginx"]}"
  vpc_security_group_ids      = ["${aws_security_group.nginx.id}"]
  subnet_id                   = "${aws_subnet.subnet_dmz.id}"
  disable_api_termination     = "${var.disable_api_termination}"
  root_block_device = {
      volume_type           = "gp2"
      volume_size           = "50G"
      delete_on_termination = "${var.delete_on_termination}"
      }

        tags  {
            Name     = "${var.project}_nginx"
            Project  = "${var.project}"
            Env      = "${var.env}"
        }

      }

  

    provisioner "file" {

            connection {
                type        = "ssh"
                user        = "centos"
                private_key = "${file("${var.private_key}")}"
            }

            source      = "/Inno/${var.project}/id_rsa"
            destination = "/home/centos/.ssh/nginx.pem"
    }
}
