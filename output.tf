output "NGINX_EIP" {
  value = "${aws_eip.nginx.public_ip}"
}
output "DATABASE_ACCESS_KEY" {
  value = "${aws_iam_access_key.user_keys.id}"
}
output "DATABASE_SECRET_KEY" {
  value = "${aws_iam_access_key.user_keys.secret}"
}
















