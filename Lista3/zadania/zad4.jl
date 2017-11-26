#Agata Jasionowska - 229726

include("roots_module.jl")
using roots_module

# MAIN
f(x) = sin(x) - (0.5 * x) ^ (2.0)
# derivative of f
pf(x) = cos(x) - 0.5 * x

# a)
(r, v, it, err) = mbisekcji(f, 1.5, 2.0, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0))
println("\nBisection:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)

# b)
(r, v, it, err) = mstycznych(f, pf, 1.5, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^(-5.0), 50)
println("\nNewton-Raphson:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)

# c)
(r, v, it, err) = msiecznych(f, 1.0, 2.0, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0), 50)
println("\nSecant method")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)
