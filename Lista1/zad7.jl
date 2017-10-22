#Agata Jasionowka - 229726

x = Float64(1.0)
n = 54
f(x) = sin(x) + cos(3 * x)                      #f(x) defined in EX7
g(x) = cos(x) - 3 * sin(3 * x)                  #f'(x)

#function returns value of f'(x) for given parameter
function aproxderiv(y)
    return ((f(x + y) - f(x)) / y)
end

#function returns abs value of subtraction between actual derivative and aproxderiv for given parameter
function approxerror(y)
    return (abs(g(x) - aproxderiv(y)))
end

println("i:\t\t\t2^(-h)")

for i = 0: 54
    y = Float64(2.0)^(-i)
    z = Float64(2.0)^(-i+1)
    println("i=$i\t$(aproxderiv(y))\t$(approxerror(y))")
end
