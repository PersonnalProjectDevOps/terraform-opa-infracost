package main

deny[msg] {
    total_monthly_cost_string := sum(input.projects[_].breakdown.totalMonthlyCost)
    total_monthly_cost := to_number(total_monthly_cost_string)
    total_monthly_cost > 100
    msg = sprintf("Total monthly cost of $%.2f exceeds the $100 limit.", [total_monthly_cost])
}


deny[msg] {
    past_total_monthly_cost_string := sum(input.projects[_].pastBreakdown.totalMonthlyCost)
    current_total_monthly_cost_string := sum(input.projects[_].breakdown.totalMonthlyCost)
    past_total_monthly_cost := to_number(past_total_monthly_cost_string)
    current_total_monthly_cost := to_number(current_total_monthly_cost_string)
    cost_increase := current_total_monthly_cost - past_total_monthly_cost
    cost_increase > 20
    msg = sprintf("The increase in infrastructure cost of $%.2f exceeds the maximum allowed increase of $20.", [cost_increase])
}