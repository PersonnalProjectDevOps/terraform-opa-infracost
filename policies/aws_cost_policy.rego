package main


deny[msg] {
  input.resource_type == "aws_instance"
  monthly_cost := input.monthly_cost
  monthly_cost > 1
  msg = "The monthly cost of the EC2 instance must be under $1."
}

deny[msg] {
  input.resource_type == "aws_db_instance"
  monthly_cost := input.monthly_cost
  monthly_cost > 5
  msg = "The monthly cost of the RDS instance must be under $5."
}