package main

sum_project_costs(projects) = total {
    total := sum({to_number(p.breakdown.totalMonthlyCost) | p = projects[_]})
}

deny[msg] {
    total_monthly_cost := sum_project_costs(input.projects)
    total_monthly_cost > 100
    msg = sprintf("Total monthly cost of $%.2f exceeds the $100 limit.", [total_monthly_cost])
}

deny[msg] {
    past_total_monthly_cost := sum_project_costs(input.projects[_].pastBreakdown)
    current_total_monthly_cost := sum_project_costs(input.projects)
    cost_increase := current_total_monthly_cost - past_total_monthly_cost
    cost_increase > 25
    msg = sprintf("The increase in infrastructure cost of $%.2f exceeds the maximum allowed increase of $25.", [cost_increase])
}
