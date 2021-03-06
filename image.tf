data "aws_ami" "image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_availability_zones" "all" {} # this code pulls all az from region which is defined on provider.tf 

output "AZ" {
  value = data.aws_availability_zones.all.names
}


# you can use your own ami as a golden image 

### data "aws_ami" "image" {
#  most_recent = true
#  owners = ["self"] # you can use your own ami as a golden image 
##}