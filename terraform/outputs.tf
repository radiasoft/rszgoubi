output "private_ip" {
    value = "${aws_instance.default.private_ip}"
}

output "public_ip" {
    value = "${aws_instance.default.public_ip}"
}
