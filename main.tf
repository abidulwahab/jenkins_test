provider "aws" {
    region = "eu-west-2"  
}

resource "aws_instance" "foo" {
  ami           = "ami-0e5f882be1900e43b" # us-west-2
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}
