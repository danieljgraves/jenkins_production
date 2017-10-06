provider "statuscake" {
  username = "${var.statuscake_usr}"
  apikey   = "${var.statuscake_api}"
}

resource "statuscake_test" "url" {
  website_name = "${var.env}.site.dev.rig.net"
  website_url  = "${var.env}.site.dev.rig.net"
  test_type    = "HTTP"
  check_rate   = 300
  confirmations = 2
  contact_id = 76580
}

variable "statuscake_usr" {}
variable "statuscake_api" {}
