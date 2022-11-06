terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.38.0"
    }
  }
}
#provider
provider "aws" {
    region = "${var.region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}
#Vpc
resource "aws_vpc" "main" {
    cidr_block = "${var.vpc_cidr}"
    tags = {
    Name = "${var.vpc_tag}"
    }
}
#Public Subnet
resource "aws_subnet" "main" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${var.public_cidr}"
    tags = {
    Name = "${var.pub_subnet_tag}"
    }
}
#AWS internet Gateway
resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.main.id}"
    tags = {
    Name = "${var.igw_tag}"
    }
}
#AWS Public Route- Main Route table
resource "aws_route" "main" {
    route_table_id = "${aws_vpc.main.main_route_table_id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
}
resource "aws_route_table_association" "b" {
    subnet_id = "${aws_subnet.main.id}"
    route_table_id = "${aws_vpc.main.main_route_table_id}"
  
}
#Security Group for Webserver
resource "aws_security_group" "Webserver-SG" {
    name = "Webserver-SG"
    description = "Allow inbound traffic for the Webserver"
    vpc_id = "${aws_vpc.main.id}"

    ingress = [
    {
        from_port = "${var.ingressfromport-http}"
        to_port = "${var.ingresstoport-http}"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
        description = "http ingress traffic"
    },
    {
        from_port = "${var.ingressfromport-https}"
        to_port = "${var.ingresstoport-https}"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
        description = "https ingress traffic"
     },
     {
        from_port = "${var.ingressfromport-ssh}"
        to_port = "${var.ingresstoport-ssh}"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
        description = "ssh access"
     },
     {
        from_port = "${var.ingressfromport-rdp}"
        to_port = "${var.ingresstoport-rdp}"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
        description = "rdp access"
    }
    ]
    egress = [
    {
        from_port = "${var.egressfromport}"
        to_port = "${var.egresstoport}"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        prefix_list_ids = []
        security_groups = []
        self = false
        description = "http egress traffic"
    }
    ]
    tags = {
    Name  = "WebserverSG"
    }
  
}

#WebServer deployment
resource "aws_instance" "webserver" {
    ami = "${var.amiid}"
    user_data = <<-EOF
    #!/bin/bash -xe
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl start httpd
    echo "<html><body><h1>Webserver deployment in AWS using Terraform</h1></body></html>" > /var/www/html/index.html
    EOF
    count = 1
    instance_type = "t2.micro"
    key_name = "${var.key_pair}"
    subnet_id = "${aws_subnet.main.id}"
    associate_public_ip_address = true
    security_groups = ["${aws_security_group.Webserver-SG.id}"]
    tags = {
    Name = "${var.instance_tags}"
    }
}