include("fancy_module.jl")
using fancy_module

# MAIN
f(x) = e^(1 - x) - 1
g(x) = x * (e^(-x))

df(x) = -e ^ (1 - x)
dg(x) = (-e ^ (-x)) * (x - 1)

# println("f(x) = e ^ (1 - x) - 1\n")

# (r, v, it, err) = mbisekcji(f, 0.1, 1.2, 10 ^ (-5.0), 10 ^ (-5.0))
# println("\nBisection:")
# println("root = ", r)
# println("value = ", v)
# println("iters = ", it)
# println("err = ", err)

# (r, v, it, err) = mstycznych(f, df, 1.5, 10 ^ (-5.0), 10 ^ (-5.0), 50)
# println("\nNewton-Raphson:")
# println("root = ", r)
# println("value = ", v)
# println("iters = ", it)
# println("err = ", err)
#
# (r, v, it, err) = msiecznych(f, 0.9, 1.1, 10 ^ (-5.0), 10 ^ (-5.0), 50)
# println("\nSecant Method:")
# println("root = ", r)
# println("value = ", v)
# println("iters = ", it)
# println("err = ", err)
#
#
println("\n\ng(x) = x * (e^-x)\n\n")

# (r, v, it, err) = mbisekcji(g, -0.5, 0.5, 10 ^ (-5.0), 10 ^ (-5.0))
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
(r, v, it, err) = msiecznych(g, -1.0, 0.3, 10 ^ (-5.0), 10 ^ (-5.0), 50)
println("\nSecant Method:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)
