provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # This is an example Amazon Linux 2 AMI ID; replace with an appropriate AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
    env  = "development"
    team = "example-team"
  }
}

resource "aws_db_instance" "example" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name                 = "example-db"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"

  tags = {
    Name = "example-db"
    env  = "development"
    team = "example-team"
  }
}
