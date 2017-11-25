include("fancy_module.jl")
using fancy_module

f(x) = x + 41
df(x) = 1

println("f(x) = x + 41, x0 = -41\n\n")

(r, v, it, err) = mbisekcji(f, -50.0, 50.0, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0))
println("\nBisection:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)

(r, v, it, err) = mstycznych(f, df, -50.0 ,0.5 * 10 ^ (-5.0), 0.5 * 10 ^(-5.0), 30)
println("\nNewton-Raphson:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)
#
(r, v, it, err) = msiecznych(f, -50.0, -30.0, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0), 30)
println("\nSecant Method:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)
