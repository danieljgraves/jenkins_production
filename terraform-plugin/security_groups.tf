resource "aws_security_group" "web" {
<<<<<<< HEAD
  name        = "Staging_Jenkins_Automation"
=======
  name        = "Production_Jenkins_Automation"
>>>>>>> 4353bd9bfbcb18c201672bb6e6205e3bb64fe308
  description = "Test Jenkinks hosts"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = [
        "0.0.0.0/0",
        ]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
        "0.0.0.0/0",
        ]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
        "0.0.0.0/0",
        ]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [
        "0.0.0.0/0",
        ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
