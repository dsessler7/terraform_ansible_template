### main.tf
# Specify the provider and access details
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "${var.aws_region}"
}
resource "aws_instance" "manager1" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  # user_data = file("${var.bootstrap_path}")
  vpc_security_group_ids = ["${aws_security_group.sgswarm.id}", "${aws_security_group.allow_http.id}", "${aws_security_group.ssh.id}"]
  tags = {
    Name  = "tf manager 1"
  }
}
resource "aws_instance" "worker1" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  # user_data = file("${var.bootstrap_path}")
  vpc_security_group_ids = ["${aws_security_group.sgswarm.id}", "${aws_security_group.ssh.id}"]
  tags = {
    Name  = "tf worker 1"
  }
}
resource "aws_instance" "worker2" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  # user_data = file("${var.bootstrap_path}")
  vpc_security_group_ids = ["${aws_security_group.sgswarm.id}", "${aws_security_group.ssh.id}"]
  tags = {
    Name  = "tf worker 2"
  }
}