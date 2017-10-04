resource "aws_instance" "web" {
  instance_type = "${var.instance_type}"
  count = 1
  ami = "${var.ami}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
  subnet_id = "${var.sub1}"
  tags {
        Name = "${var.env}-${var.hostname}"
        Role = "${var.role}"
        Environment = "${var.env}"
        Owner = "Daniel.Graves@rig.net"
        PrincipalId = "AIDAJQPTTLIJNWDTZJBBQ"
  }

  provisioner "remote-exec" {
    inline = [
	"echo Checking for system updates...",
	"sudo apt-get -y update",
	"echo Installing system updates DONE!",
	"sudo sed -i 's&/var/www/html&${var.web_dir}&' /etc/apache2/sites-available/000-default.conf",
	"cd /var/www/ && sudo rm -rf html/ && sudo -Hu www-data git clone ${var.git_home} && sudo chown -R www-data:www-data -R /var/www/",
	"sudo service apache2 reload",
	"sudo service apache2 restart"
	    ]
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = "${file("~/.ssh/deploy.pem")}"
    }
  }

}
