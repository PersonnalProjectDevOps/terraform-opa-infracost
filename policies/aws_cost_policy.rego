package main


deny[msg] {
    total_monthly_cost := sum(input.projects[_].breakdown.totalMonthlyCost)
    total_monthly_cost > 1
    msg = sprintf("Total monthly cost of $%.2f exceeds the $100 limit.", [total_monthly_cost])
}