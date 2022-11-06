variable "region" { 
}
variable "access_key" {
    type = string
    sensitive = true 
}

variable "secret_key" {
    type = string
    sensitive = true 
}
variable "vpc_cidr" { 
}
variable "vpc_tag" {  
}
variable "public_cidr" { 
}
variable "pub_subnet_tag" { 
}
variable "igw_tag" { 
}
variable "amiid" { 
}
variable "instance_type" { 
}
variable "key_pair" { 
}
variable "instance_tags" { 
}
variable "egresstoport" { 
}
variable "egressfromport" { 
}
variable "ingressfromport-http" { 
}
variable "ingresstoport-http" { 
}
variable "ingressfromport-https" { 
}
variable "ingresstoport-https" { 
}
variable "ingressfromport-ssh" { 
}
variable "ingresstoport-ssh" { 
}
variable "ingressfromport-rdp" { 
}
variable "ingresstoport-rdp" { 
}