### output.tf
output "manager_public_ip" {
    value = ["${aws_instance.manager1.public_ip}"]
}
output "worker1_public_ip" {
    value = ["${aws_instance.worker1.public_ip}"]
}
output "worker2_public_ip" {
    value = ["${aws_instance.worker2.public_ip}"]
}

resource "local_file" "hosts" {
  content = <<-DOC
    [managers]
    ${aws_instance.manager1.public_ip} ansible_user=ec2-user ansible_private_key_file=~/ssh-keys/ec2-docker.pem
    [workers]
    ${aws_instance.worker1.public_ip} ansible_user=ec2-user ansible_private_key_file=~/ssh-keys/ec2-docker.pem
    ${aws_instance.worker2.public_ip} ansible_user=ec2-user ansible_private_key_file=~/ssh-keys/ec2-docker.pem
    DOC
  filename = "./inventory/hosts"
}