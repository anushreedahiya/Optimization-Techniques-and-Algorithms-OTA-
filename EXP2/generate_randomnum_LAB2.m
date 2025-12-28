% 3. Function to generate array of size nX d between some LB, UB
function arr = generate_randomnum_LAB2(n, d, LB, UB)
arr = LB + (UB - LB) * rand(n, d);
end

