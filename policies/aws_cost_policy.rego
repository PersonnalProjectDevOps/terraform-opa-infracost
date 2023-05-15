package main

deny[msg] {
    total_monthly_cost := sum_project_costs(input.projects)
    total_monthly_cost > 0
    msg = sprintf("Total monthly cost of $%.2f exceeds the $100 limit.", [total_monthly_cost])
}

sum_project_costs(projects) = total_cost {
    cost_list := [to_number(projects[i].breakdown.totalMonthlyCost) | i := range(projects)]
    total_cost := sum(cost_list)
}

sum(arr) = result {
    result := 0
    _ = arr[_]
    result = result + arr[_]
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