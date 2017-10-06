resource "aws_elb" "app1" {
  name = "${var.env}-app"
  subnets = ["${var.sub1}"]
  security_groups = ["${aws_security_group.web.id}"]

  listener {
	instance_port = 80
	instance_protocol = "http"
	lb_port = 80
	lb_protocol = "http"
	}

  health_check {
	healthy_threshold = 3
	unhealthy_threshold = 4
	timeout = 3
	target = "HTTP:80/deploy.php"
	interval = 5
	}

  instances = ["${aws_instance.web.id}"]
  idle_timeout = 400
}
