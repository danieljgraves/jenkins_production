resource "aws_instance" "web" {
  instance_type = "${var.instance_type}"
  count = 1
  ami = "${var.ami}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
  subnet_id = "${var.sub3}"
  tags {
        Name = "${var.hostname}"
        Role = "${var.role}"
        Environment = "${var.env}"
        Owner = "Daniel.Graves@rig.net"
        PrincipalId = "AIDAJQPTTLIJNWDTZJBBQ"
  }

  provisioner "file" {
    source      = "~/deploy.php"
    destination = "${var.web_dir}"
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = "${file("~/.ssh/deploy.pem")}"
    }
  }

  provisioner "remote-exec" {
    inline = [
	"sudo apt-get -y update",
	"echo Installing system updates DONE!",
	"cd ${var.web_dir} && sudo chown www-data:www-data deploy.php && sudo git remote set-url origin ${var.git_home}.git"
    ]
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = "${file("~/.ssh/deploy.pem")}"
    }
  }

}
