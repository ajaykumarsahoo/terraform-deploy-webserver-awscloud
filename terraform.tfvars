region= "ap-south-1"
access_key= "xxxxxxxxxxxxxxxxxxxx"
secret_key= "xxxxxxxxxxxxxxxxxxxxxxxxx"
vpc_tag = "terrafrom-vpc"
vpc_cidr = "12.0.0.0/16"
public_cidr = "12.0.0.0/24"
igw_tag = "igw-terraform"
pub_subnet_tag = "publicsubnet-terraform"
amiid = "ami-0e6329e222e662a52"
instance_type = "t2.micro"
key_pair = "terraform"
instance_tags = "Webserver_instance"
egresstoport = "0"
egressfromport = "0"
ingressfromport-http = "80"
ingresstoport-http = "80"
ingressfromport-https = "443"
ingresstoport-https = "443"
ingressfromport-ssh = "22"
ingresstoport-ssh = "22"
ingressfromport-rdp = "3389"
ingresstoport-rdp = "3389"
