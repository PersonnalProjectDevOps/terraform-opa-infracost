package main


deny[msg] {
    total_monthly_cost := sum(input.projects[_].breakdown.totalMonthlyCost)
    total_monthly_cost > 1
    msg = sprintf("Total monthly cost of $%.2f exceeds the $100 limit.", [total_monthly_cost])
}


deny[msg] {
    past_total_monthly_cost := sum(input.projects[_].pastBreakdown.totalMonthlyCost)
    current_total_monthly_cost := sum(input.projects[_].breakdown.totalMonthlyCost)
    cost_increase := current_total_monthly_cost - past_total_monthly_cost
    cost_increase > 20
    msg = sprintf("The increase in infrastructure cost of $%.2f exceeds the maximum allowed increase of $20.", [cost_increase])
}