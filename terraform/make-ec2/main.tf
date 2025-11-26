# Create an EC2 instance

# Provider block - What providers do we need to interact with?

# We will use aws
provider "aws" {
    region = "eu-west-1"

    # Terraform will download all the required dependencies/plugins when you run "terraform init"
}

# Which service/resource
resource "aws_instance" "basic_instance"{
    #AMI ID
    ami = "ami-008b082bb4488df2b"

    #What instance type?
    instance_type ="t3.micro"
    
    # We want auto- assigned public instance_typeassociate_public_ip_address = instance_typeassociate_public_ip_address

    # Name instance on aws
    tags ={
        Name="se-kaki-test-tf-instance"
    }
}