provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-02b64aa047cb5edf5"
  instance_type          = "c7i-flex.large"
  key_name               = "DONKEY"
  vpc_security_group_ids = ["sg-046cd16cdb7a78595"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
