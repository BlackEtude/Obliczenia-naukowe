#Agata Jasionowska - 229726

include("fancy_module.jl")
using fancy_module

f(x) = x^2 - 9
df(x) = 2*x

g(x) = x^3 - 14
dg(x) = 3 * x^2

println("f(x) = x^2 - 9:\n")

(r, v, it, err) = mbisekcji(f, 1.5, 6.5, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0))
println("\nBisection:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)

(r, v, it, err) = mstycznych(f, df, 1.5, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^(-5.0), 50)
println("\nNewton-Raphson:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)
#
(r, v, it, err) = msiecznych(f, 1.0, 2.0, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0), 50)
println("\nSecant Method:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)


println("\ng(x) = x^3 - 14:\n")

(r, v, it, err) = mbisekcji(g, 1.5, 6.5, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0))
println("\nBisection:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)

(r, v, it, err) = mstycznych(g, dg, 1.5, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^(-5.0), 50)
println("\nNewton-Raphson:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)
#
(r, v, it, err) = msiecznych(g, 1.0, 2.0, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0), 50)
println("\nSecant Method:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)
