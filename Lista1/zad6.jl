#Agata Jasionowska - 229726

#Calculate 10 next values f(x) and g(x) defined in EX6
steps = 10
for i = 1 : steps
    a = Float64(8)^(-i)
    f = sqrt(a^2 + 1) - 1
    g = a^2 / (sqrt(a^2 + 1) + 1)
    
    println("x^$(i)")
    println("f(a) = $f")
    println("g(a) = $g\n")
end
