resource "aws_instance" "db" {
  ami                         = "${var.centos_ami_id["${var.aws_region}"]}"
  instance_type               = "${var.instance_type["db"]}"
  key_name                    = "${aws_key_pair.database.id}"
  monitoring                  = true
  count                       = "${length(var.db_private_ip)}"
  private_ip                  = "${var.private_ip["db"]}"
  vpc_security_group_ids      = ["${aws_security_group.database.id}"]
  subnet_id                   = "${aws_subnet.subnet_database.id}"
  disable_api_termination     = "${var.disable_api_termination}"
  root_block_device = {
      volume_type           = "gp2"
      volume_size           = "10G"
      delete_on_termination = "${var.delete_on_termination}"
      }

  tags  {
          Name     = "${var.project}_db"
          Project  = "${var.project}"
          Env      = "${var.env}"
     }

  ebs_block_device {
          device_name           = "/dev/sdb"
          volume_size           = "20G"
          volume_type           = "gp2"
          encrypted             = true
          delete_on_termination = "${var.delete_on_termination}"
      }


  volume_tags {
      Name          = "${var.project}_db"
      Project       = "${var.project}"
      Env           = "${var.env}"
  }
}
