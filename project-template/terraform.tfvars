company = "Infosys"
project = "Cloud-Template"

vpc_cidr_block = {
  dev  = "10.0.0.0/16"
  uat  = "10.1.0.0/16"
  prod = "10.2.0.0/16"
}

vpc_subnet_count = {
  dev  = 2
  uat  = 2
  prod = 3
}

instance_type = {
  dev  = "t2.micro"
  uat  = "t2.small"
  prod = "t2.medium"
}

instance_count = {
  dev  = 2
  uat  = 4
  prod = 6
}