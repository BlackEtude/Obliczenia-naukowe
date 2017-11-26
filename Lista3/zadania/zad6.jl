#Agata Jasionowska - 229726

include("fancy_module.jl")
using fancy_module

# MAIN

f(x) = e^(1 - x) - 1
g(x) = x * (e^(-x))

# derivative of f
df(x) = -e ^ (1 - x)
# derivative of g
dg(x) = (-e ^ (-x)) * (x - 1)

println("f(x) = e ^ (1 - x) - 1\n")

# (r, v, it, err) = mbisekcji(f, 0.1, 1.2, 10 ^ (-5.0), 10 ^ (-5.0))
# println("\nBisection:")
# println("root = ", r)
# println("value = ", v)
# println("iters = ", it)
# println("err = ", err)
#
# (r, v, it, err) = mstycznych(f, df, 0.3, 10 ^ (-5.0), 10 ^ (-5.0), 50)
# println("\nNewton-Raphson:")
# println("root = ", r)
# println("value = ", v)
# println("iters = ", it)
# println("err = ", err)
#
# (r, v, it, err) = msiecznych(f, 0.9, 1.1, 10 ^ (-5.0), 10 ^ (-5.0), 50)
# println("\nSecant method:")
# println("root = ", r)
# println("value = ", v)
# println("iters = ", it)
# println("err = ", err)
#
#
# println("\ng(x) = x * (e^-x)\n")
#
# (r, v, it, err) = mbisekcji(g, -0.4, 0.7, 10 ^ (-5.0), 10 ^ (-5.0))
# println("\nBisection:")
# println("root = ", r)
# println("value = ", v)
# println("iters = ", it)
# println("err = ", err)
#
#
# (r, v, it, err) = mstycznych(g, dg, -0.1, 10 ^ (-5.0), 10 ^ (-5.0), 50)
# println("\nNewton-Raphson:")
# println("root = ", r)
# println("value = ", v)
# println("iters = ", it)
# println("err = ", err)
#
#
# (r, v, it, err) = msiecznych(g, -0.1, 0.9, 10 ^ (-5.0), 10 ^ (-5.0), 50)
# println("\nSecant method:")
# println("root = ", r)
# println("value = ", v)
# println("iters = ", it)
# println("err = ", err)

(r, v, it, err) = mbisekcji(f, -0.4, 0.6, 10 ^ (-5.0), 10 ^ (-5.0))
println("\nBisection:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)
