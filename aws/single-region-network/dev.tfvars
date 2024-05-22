network_info = {
  name       = "primary"
  cidr_block = "10.10.0.0/16"
}

public_subnets = [{
  name       = "web-1"
  cidr_range = "10.10.0.0/24"
  av_zone    = "ap-south-1a"
  }, {
  name       = "web-2"
  cidr_range = "10.10.1.0/24"
  av_zone    = "ap-south-1b"
  }, {
  name       = "web-3"
  cidr_range = "10.10.2.0/24"
  av_zone    = "ap-south-1c"
  }
]

private_subnets = [{
  name       = "db-1"
  cidr_range = "10.10.3.0/24"
  av_zone    = "ap-south-1a"
  }, {
  name       = "db-2"
  cidr_range = "10.10.4.0/24"
  av_zone    = "ap-south-1b"
  }, {
  name       = "db-3"
  cidr_range = "10.10.5.0/24"
  av_zone    = "ap-south-1c"
  }
]

security_group_info = {
  name        = "web-server"
  description = "rules for web server"
  vpc_id      = ""
  inbound_rules = [{
    cidr        = "0.0.0.0/0"
    port        = 22
    protocol    = "tcp"
    description = "open ssh"
    }, {
    cidr        = "0.0.0.0/0"
    port        = 80
    protocol    = "tcp"
    description = "open http"
  }]
  outbound_rules   = []
  allow_all_egress = true
}

ec2_instance_info = [{
  name              = "webserver-1"
  ami_id            = "ami-0f58b397bc5c1f2e8"
  instance_type     = "t2.micro"
  key_name          = "id_rsa"
  subnet_id         = ""
  security_group_id = ""
  }, {
  name              = "webserver-2"
  ami_id            = "ami-0f58b397bc5c1f2e8"
  instance_type     = "t2.micro"
  key_name          = "id_rsa"
  subnet_id         = ""
  security_group_id = ""
}]
