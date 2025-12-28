% 5. Function to find the capaciy of a gas production facility
function capacity = capacity_gas_production_OTALab2(m1, m2)
capacity = 61.8 + 5.72*m1 + 0.2623*[(40-m1)*(log(m2 / 200))^(-0.85) + 0.087*(40-m1)*(log(m2 / 200)) + (700.23*m2)^(-0.75)]
end
