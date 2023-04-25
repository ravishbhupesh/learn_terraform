###############
#   PROVIDER
###############

provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = var.region
}

###############
#    DATA
###############

data "aws_ssm_parameter" "ami" {
    name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

###############
#   RESOURCES
###############

# VPC
resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
}

# Subnets
resource "aws_subnet" "pub-sub-1" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
}

resource "aws_subnet" "pub-sub-2" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
}

resource "aws_subnet" "pvt-sub-1" {
    cidr_block = "10.0.3.0/24"
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = false
}

resource "aws_subnet" "pvt-sub-2" {
    cidr_block = "10.0.4.0/24"
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = false
}

# Route Table
resource "aws_route_table" "rtb" {
    vpc_id = aws_vpc.vpc.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    } 
}

resource "aws_route_table_association" "rta-pub-sub-1" {
    subnet_id = aws_subnet.pub-sub-1.id
    route_table_id = aws_route_table.rtb.id
}

resource "aws_route_table_association" "rta-pub-sub-2" {
    subnet_id = aws_subnet.pub-sub-2.id
    route_table_id = aws_route_table.rtb.id
}

# Security Groups
resource "aws_security_group" "sg-web" {
    name = "sg_web"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    } 

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    } 
}

resource "aws_instance" "nginx" {
    ami = nonsensitive(data.aws_ssm_parameter.ami.value)
    instance_type = "t2.micro"
    subnet_id = aws_subnet.pub-sub-1.id
    vpc_security_group_ids = [ aws_security_group.sg-web.id ]

    user_data = <<EOF
#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
sudo rm /usr/share/nginx/html/index.html
echo '<html><head><title>Taco Team Server</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">You did it! Have a &#127790;</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
EOF
}