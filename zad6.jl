#Agata Jasionowska - 229726

#=
Policz w języku Julia w arytmetyce Float64 wartości następujących funkcji
f(x), g(x) dla kolejnych wartości argumentu x = 8^-1, 8^−2, 8^−3,....
Chociaż f = g komputer daje różne wyniki. Które z nich są wiarygodne, a
które nie?
=#

steps = 10
for i = 1 : steps
    a = Float64(8)^(-i)

    println("x^$(i)")
    f = sqrt(a^2 + 1) - 1
    println("f(a) = $f")

    g = a^2 / (sqrt(a^2 + 1) + 1)
    println("g(a) = $g\n")
end
