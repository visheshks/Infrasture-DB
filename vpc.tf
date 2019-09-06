resource "aws_vpc" "main" {
  cidr_block       = "${var.cidr_block["vpc"]}"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
      Name          = "${var.project}_vpc"
      Project       = "${var.project}"          
  }
}
