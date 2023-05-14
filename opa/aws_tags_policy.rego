package main

deny[msg] {
  input.resource_type == "aws_instance"
  not input.tags.env
  msg = "Missing required tag 'env' for EC2 instance."
}

deny[msg] {
  input.resource_type == "aws_instance"
  not input.tags.team
  msg = "Missing required tag 'team' for EC2 instance."
}

deny[msg] {
  input.resource_type == "aws_db_instance"
  not input.tags.env
  msg = "Missing required tag 'env' for RDS instance."
}

deny[msg] {
  input.resource_type == "aws_db_instance"
  not input.tags.team
  msg = "Missing required tag 'team' for RDS instance."
}

deny[msg] {
  input.resource_type == "aws_db_instance"
  input.change_actions[_] == "destroy"
  msg = "Destroying RDS instances is not allowed."
}