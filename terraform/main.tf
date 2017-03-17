# Specify the provider and access details
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

resource "aws_eip" "default" {
    instance = "${aws_instance.default.id}"
    vpc      = true
}

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "default" {
    name        = "rszgoubi-compute"
    description = "rszgoubi profiling runner"
    
    # SSH access from anywhere
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    
    # outbound internet access
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "default" {
    instance_type = "t2.micro"
  
    # Lookup the correct AMI based on the region
    # we specified
    ami = "${lookup(var.aws_amis, var.aws_region)}"
  
    key_name = "${aws_key_pair.default.key_name}"
  
    # Our Security group to allow HTTP and SSH access
    security_groups = ["${aws_security_group.default.name}"]
  
    #Instance tags
    tags {
      Name = "rszgoubi-compute"
    }
}

resource "aws_key_pair" "default" {
    key_name = "rszgoubi-compute"
    public_key = "${file("ssh/id_rsa.pub")}"
}

