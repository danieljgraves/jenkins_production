resource "aws_instance" "web" {
  instance_type = "${var.instance_type}"
  count = 1
  ami = "${var.ami}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
  subnet_id = "${var.sub2}"
  tags {
        Name = "${var.hostname}"
        Role = "${var.role}"
        Environment = "${var.env}"
        Owner = "Daniel.Graves@rig.net"
        PrincipalId = "AIDAJQPTTLIJNWDTZJBBQ"
  }

  provisioner "remote-exec" {
    inline = [
	"sudo apt-get -y update",
	"echo Installing system updates DONE!",
    ]
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = "${file("~/.ssh/deploy.pem")}"
    }
  }

}
