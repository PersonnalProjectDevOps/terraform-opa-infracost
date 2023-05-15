package main

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  not resource.change.after.tags.env
  msg = "Missing required tag 'env' for EC2 instance."
}

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  not resource.change.after.tags.team
  msg = "Missing required tag 'team' for EC2 instance."
}

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_db_instance"
  not resource.change.after.tags.env
  msg = "Missing required tag 'env' for RDS instance."
}

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_db_instance"
  not resource.change.after.tags.team
  msg = "Missing required tag 'team' for RDS instance."
}

deny[msg] {
  input.resource_type == "aws_db_instance"
  input.change_actions[_] == "destroy"
  msg = "Destroying RDS instances is not allowed."
}
